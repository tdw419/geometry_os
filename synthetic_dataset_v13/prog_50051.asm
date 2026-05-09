; DESCRIPTION: Composite: Draws a green line from (447, 24) to (454, 153) then Creates a cyan circular shape at (270, 154) with radius 45 then Places a white dot at position (44, 30).
; PLAN: r0=447(x1), r1=24(y1), r2=454(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=154(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x), r11=30(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 24
LDI r2, 454
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 154
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 30
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT

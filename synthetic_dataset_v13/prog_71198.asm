; DESCRIPTION: Composite: Creates a cyan circular shape at (208, 191) with radius 55 then Draws a green line from (60, 57) to (454, 76) then Sets a single white pixel at (166, 144).
; PLAN: r0=208(x), r1=191(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=57(y1), r7=454(x2), r8=76(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=144(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 191
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 57
LDI r7, 454
LDI r8, 76
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 144
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT

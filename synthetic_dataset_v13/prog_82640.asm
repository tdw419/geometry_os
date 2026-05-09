; DESCRIPTION: Composite: Places a white line segment connecting (106, 0) to (96, 155) then Creates a cyan circular shape at (103, 165) with radius 58 then Places a yellow dot at position (284, 190).
; PLAN: r0=106(x1), r1=0(y1), r2=96(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=165(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=190(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 0
LDI r2, 96
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 165
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 190
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

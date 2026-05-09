; DESCRIPTION: Composite: Places a magenta line segment connecting (293, 142) to (439, 80) then Draws a cyan circle centered at (312, 105) with radius 15 then Sets a single yellow pixel at (495, 238).
; PLAN: r0=293(x1), r1=142(y1), r2=439(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=105(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x), r11=238(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 142
LDI r2, 439
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 105
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 238
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

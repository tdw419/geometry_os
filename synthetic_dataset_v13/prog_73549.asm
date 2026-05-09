; DESCRIPTION: Composite: Places a cyan line segment connecting (57, 117) to (136, 68) then Creates a green circular shape at (432, 157) with radius 68 then Sets a single green pixel at (77, 40).
; PLAN: r0=57(x1), r1=117(y1), r2=136(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=157(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=40(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 57
LDI r1, 117
LDI r2, 136
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 157
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 40
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

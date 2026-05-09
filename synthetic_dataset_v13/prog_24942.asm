; DESCRIPTION: Composite: Renders a orange line between points (181, 161) and (41, 160) then Creates a white circular shape at (326, 31) with radius 15 then Sets a single cyan pixel at (341, 141).
; PLAN: r0=181(x1), r1=161(y1), r2=41(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=31(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=341(x), r11=141(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 181
LDI r1, 161
LDI r2, 41
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 31
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 341
LDI r11, 141
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

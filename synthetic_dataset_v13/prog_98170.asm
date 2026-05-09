; DESCRIPTION: Composite: Places a orange line segment connecting (1, 76) to (268, 186) then Places a purple dot at position (254, 58) then Places a white circle of radius 41 at center (357, 52).
; PLAN: r0=1(x1), r1=76(y1), r2=268(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=58(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=357(x), r11=52(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 1
LDI r1, 76
LDI r2, 268
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 58
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 357
LDI r11, 52
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Places a orange dot at position (303, 77) then Creates a yellow circular shape at (332, 158) with radius 70 then Places a purple line segment connecting (401, 57) to (342, 41).
; PLAN: r0=303(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=158(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x1), r11=57(y1), r12=342(x2), r13=41(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 332
LDI r6, 158
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 57
LDI r12, 342
LDI r13, 41
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

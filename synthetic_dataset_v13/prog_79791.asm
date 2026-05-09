; DESCRIPTION: Composite: Places a orange line segment connecting (395, 125) to (222, 102) then Places a purple circle of radius 46 at center (351, 56).
; PLAN: r0=395(x1), r1=125(y1), r2=222(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=56(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 125
LDI r2, 222
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 56
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Creates a purple circular shape at (364, 94) with radius 49 then Places a orange line segment connecting (41, 132) to (445, 108).
; PLAN: r0=364(x), r1=94(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x1), r6=132(y1), r7=445(x2), r8=108(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 94
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 132
LDI r7, 445
LDI r8, 108
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

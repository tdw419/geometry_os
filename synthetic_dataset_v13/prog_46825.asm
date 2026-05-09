; DESCRIPTION: Composite: Places a orange line segment connecting (395, 150) to (310, 159) then Places a orange circle of radius 52 at center (71, 72).
; PLAN: r0=395(x1), r1=150(y1), r2=310(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=72(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 150
LDI r2, 310
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 72
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

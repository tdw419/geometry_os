; DESCRIPTION: Composite: Renders a orange disk with center (123, 85) and radius 18 then Places a orange line segment connecting (260, 18) to (471, 48).
; PLAN: r0=123(x), r1=85(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=18(y1), r7=471(x2), r8=48(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 85
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 18
LDI r7, 471
LDI r8, 48
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

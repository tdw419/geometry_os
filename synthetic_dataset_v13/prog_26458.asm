; DESCRIPTION: Composite: Renders a red disk with center (348, 179) and radius 15 then Places a orange line segment connecting (343, 94) to (189, 120).
; PLAN: r0=348(x), r1=179(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=94(y1), r7=189(x2), r8=120(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 179
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 94
LDI r7, 189
LDI r8, 120
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

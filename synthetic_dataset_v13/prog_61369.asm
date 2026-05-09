; DESCRIPTION: Composite: Creates a red circular shape at (399, 60) with radius 50 then Places a orange line segment connecting (93, 131) to (59, 77).
; PLAN: r0=399(x), r1=60(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x1), r6=131(y1), r7=59(x2), r8=77(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 60
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 131
LDI r7, 59
LDI r8, 77
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

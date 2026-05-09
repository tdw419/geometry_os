; DESCRIPTION: Composite: Draws a orange line from (100, 10) to (403, 183) then Draws a red circle centered at (219, 74) with radius 62.
; PLAN: r0=100(x1), r1=10(y1), r2=403(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=74(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 10
LDI r2, 403
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 74
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

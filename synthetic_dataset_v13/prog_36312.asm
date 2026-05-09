; DESCRIPTION: Composite: Renders a red disk with center (289, 102) and radius 69 then Draws a orange line from (386, 221) to (360, 88).
; PLAN: r0=289(x), r1=102(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x1), r6=221(y1), r7=360(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 102
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 221
LDI r7, 360
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

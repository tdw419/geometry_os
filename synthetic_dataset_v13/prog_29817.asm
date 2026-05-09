; DESCRIPTION: Composite: Renders a black disk with center (134, 122) and radius 19 then Draws a blue line from (413, 29) to (421, 141).
; PLAN: r0=134(x), r1=122(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x1), r6=29(y1), r7=421(x2), r8=141(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 122
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 29
LDI r7, 421
LDI r8, 141
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT

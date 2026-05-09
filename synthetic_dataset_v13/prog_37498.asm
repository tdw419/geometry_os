; DESCRIPTION: Composite: Renders a black disk with center (352, 116) and radius 69 then Places a black line segment connecting (375, 6) to (22, 197).
; PLAN: r0=352(x), r1=116(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x1), r6=6(y1), r7=22(x2), r8=197(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 116
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 6
LDI r7, 22
LDI r8, 197
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

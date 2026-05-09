; DESCRIPTION: Composite: Places a orange line segment connecting (322, 49) to (61, 223) then Renders a black disk with center (232, 34) and radius 25.
; PLAN: r0=322(x1), r1=49(y1), r2=61(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=34(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 49
LDI r2, 61
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 34
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

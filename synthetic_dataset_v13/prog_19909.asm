; DESCRIPTION: Composite: Renders a green line between points (141, 38) and (491, 251) then Creates a blue circular shape at (223, 115) with radius 73.
; PLAN: r0=141(x1), r1=38(y1), r2=491(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=115(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 141
LDI r1, 38
LDI r2, 491
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 115
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

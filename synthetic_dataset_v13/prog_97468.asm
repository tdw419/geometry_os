; DESCRIPTION: Composite: Draws a white line from (161, 12) to (287, 101) then Renders a blue disk with center (478, 34) and radius 33.
; PLAN: r0=161(x1), r1=12(y1), r2=287(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=34(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 12
LDI r2, 287
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 34
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

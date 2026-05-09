; DESCRIPTION: Composite: Draws a white line from (432, 155) to (94, 244) then Renders a blue disk with center (141, 34) and radius 30.
; PLAN: r0=432(x1), r1=155(y1), r2=94(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=34(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 432
LDI r1, 155
LDI r2, 94
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 34
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

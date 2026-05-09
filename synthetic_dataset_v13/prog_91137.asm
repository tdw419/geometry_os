; DESCRIPTION: Composite: Draws a blue line from (158, 234) to (321, 20) then Renders a black disk with center (78, 80) and radius 50.
; PLAN: r0=158(x1), r1=234(y1), r2=321(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=80(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 158
LDI r1, 234
LDI r2, 321
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 80
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a orange line segment connecting (208, 38) to (367, 185) then Renders a purple disk with center (60, 169) and radius 40.
; PLAN: r0=208(x1), r1=38(y1), r2=367(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=169(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 38
LDI r2, 367
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 169
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

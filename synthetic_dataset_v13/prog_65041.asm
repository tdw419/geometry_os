; DESCRIPTION: Composite: Places a purple line segment connecting (192, 211) to (138, 220) then Renders a yellow disk with center (199, 184) and radius 70.
; PLAN: r0=192(x1), r1=211(y1), r2=138(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=184(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 192
LDI r1, 211
LDI r2, 138
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 184
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

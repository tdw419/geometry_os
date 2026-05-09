; DESCRIPTION: Composite: Renders a purple disk with center (379, 96) and radius 52 then Places a blue line segment connecting (396, 6) to (136, 4).
; PLAN: r0=379(x), r1=96(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=6(y1), r7=136(x2), r8=4(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 96
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 6
LDI r7, 136
LDI r8, 4
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT

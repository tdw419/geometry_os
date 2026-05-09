; DESCRIPTION: Composite: Renders a purple disk with center (322, 144) and radius 68 then Places a purple line segment connecting (476, 140) to (125, 58).
; PLAN: r0=322(x), r1=144(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x1), r6=140(y1), r7=125(x2), r8=58(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 144
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 140
LDI r7, 125
LDI r8, 58
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

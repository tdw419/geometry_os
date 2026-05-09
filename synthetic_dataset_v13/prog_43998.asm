; DESCRIPTION: Composite: Places a purple line segment connecting (21, 186) to (23, 147) then Renders a purple disk with center (250, 188) and radius 47.
; PLAN: r0=21(x1), r1=186(y1), r2=23(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=188(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 186
LDI r2, 23
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 188
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

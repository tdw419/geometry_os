; DESCRIPTION: Composite: Draws a purple line from (388, 155) to (311, 148) then Renders a magenta disk with center (269, 76) and radius 56.
; PLAN: r0=388(x1), r1=155(y1), r2=311(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=76(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 155
LDI r2, 311
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 76
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

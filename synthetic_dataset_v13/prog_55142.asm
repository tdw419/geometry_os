; DESCRIPTION: Composite: Places a white line segment connecting (312, 80) to (261, 90) then Places a magenta dot at position (322, 155) then Renders a magenta disk with center (94, 163) and radius 22.
; PLAN: r0=312(x1), r1=80(y1), r2=261(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=155(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=163(y), r12=22(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 80
LDI r2, 261
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 155
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 163
LDI r12, 22
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

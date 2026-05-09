; DESCRIPTION: Composite: Sets a single yellow pixel at (341, 198) then Places a green circle of radius 27 at center (297, 188) then Places a purple line segment connecting (447, 176) to (103, 158).
; PLAN: r0=341(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=188(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x1), r11=176(y1), r12=103(x2), r13=158(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 198
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 188
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 176
LDI r12, 103
LDI r13, 158
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

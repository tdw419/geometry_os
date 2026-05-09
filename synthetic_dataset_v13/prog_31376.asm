; DESCRIPTION: Composite: Places a blue line segment connecting (304, 121) to (73, 147) then Draws a blue circle centered at (390, 230) with radius 12.
; PLAN: r0=304(x1), r1=121(y1), r2=73(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=230(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 121
LDI r2, 73
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 230
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

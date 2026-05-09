; DESCRIPTION: Composite: Places a purple line segment connecting (313, 252) to (155, 147) then Creates a magenta rectangular region at (200, 46) spanning 100 by 111 pixels.
; PLAN: r0=313(x1), r1=252(y1), r2=155(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=46(y), r7=100(width), r8=111(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 252
LDI r2, 155
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 46
LDI r7, 100
LDI r8, 111
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a orange line segment connecting (378, 67) to (181, 179) then Draws a red circle centered at (202, 153) with radius 70.
; PLAN: r0=378(x1), r1=67(y1), r2=181(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=153(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 67
LDI r2, 181
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 153
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

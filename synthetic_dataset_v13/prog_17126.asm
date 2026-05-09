; DESCRIPTION: Composite: Creates a purple rectangular region at (418, 13) spanning 59 by 22 pixels then Places a blue line segment connecting (328, 53) to (490, 105).
; PLAN: r0=418(x), r1=13(y), r2=59(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x1), r6=53(y1), r7=490(x2), r8=105(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 13
LDI r2, 59
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 53
LDI r7, 490
LDI r8, 105
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT

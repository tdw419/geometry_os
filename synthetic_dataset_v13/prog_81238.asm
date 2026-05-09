; DESCRIPTION: Composite: Draws a blue rectangle at (199, 38) with width 69 and height 88 then Places a purple line segment connecting (213, 231) to (84, 99).
; PLAN: r0=199(x), r1=38(y), r2=69(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=231(y1), r7=84(x2), r8=99(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 38
LDI r2, 69
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 231
LDI r7, 84
LDI r8, 99
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

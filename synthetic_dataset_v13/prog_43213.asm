; DESCRIPTION: Composite: Renders a purple line between points (219, 205) and (200, 254) then Draws a purple rectangle at (476, 108) with width 13 and height 53.
; PLAN: r0=219(x1), r1=205(y1), r2=200(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=108(y), r7=13(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 205
LDI r2, 200
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 108
LDI r7, 13
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT

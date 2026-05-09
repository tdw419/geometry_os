; DESCRIPTION: Composite: Draws a purple rectangle at (74, 1) with width 110 and height 70 then Places a white line segment connecting (230, 227) to (260, 184).
; PLAN: r0=74(x), r1=1(y), r2=110(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=227(y1), r7=260(x2), r8=184(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 1
LDI r2, 110
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 227
LDI r7, 260
LDI r8, 184
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT

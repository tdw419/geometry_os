; DESCRIPTION: Composite: Renders a blue line between points (54, 158) and (400, 3) then Draws a blue rectangle at (185, 199) with width 32 and height 54.
; PLAN: r0=54(x1), r1=158(y1), r2=400(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=199(y), r7=32(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 158
LDI r2, 400
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 199
LDI r7, 32
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

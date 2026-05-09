; DESCRIPTION: Composite: Draws a black line from (416, 251) to (93, 8) then Draws a blue rectangle at (96, 208) with width 105 and height 10 then Creates a black circular shape at (308, 95) with radius 38.
; PLAN: r0=416(x1), r1=251(y1), r2=93(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=208(y), r7=105(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=95(y), r12=38(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 251
LDI r2, 93
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 208
LDI r7, 105
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 95
LDI r12, 38
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

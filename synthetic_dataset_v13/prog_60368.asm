; DESCRIPTION: Composite: Places a black 28x95 rectangle at position (298, 157) then Draws a blue line from (278, 118) to (137, 37) then Draws a white circle centered at (459, 38) with radius 23.
; PLAN: r0=298(x), r1=157(y), r2=28(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=118(y1), r7=137(x2), r8=37(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=38(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 157
LDI r2, 28
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 118
LDI r7, 137
LDI r8, 37
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 38
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

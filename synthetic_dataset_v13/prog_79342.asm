; DESCRIPTION: Composite: Renders a black line between points (52, 68) and (223, 203) then Places a green dot at position (38, 20) then Draws a blue rectangle at (15, 115) with width 97 and height 52.
; PLAN: r0=52(x1), r1=68(y1), r2=223(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=115(y), r12=97(width), r13=52(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 68
LDI r2, 223
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 15
LDI r11, 115
LDI r12, 97
LDI r13, 52
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

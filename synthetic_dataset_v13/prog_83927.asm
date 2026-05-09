; DESCRIPTION: Composite: Places a white 67x113 rectangle at position (334, 17) then Renders a cyan line between points (43, 56) and (453, 115) then Draws a blue circle centered at (198, 133) with radius 79.
; PLAN: r0=334(x), r1=17(y), r2=67(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x1), r6=56(y1), r7=453(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=133(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 17
LDI r2, 67
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 56
LDI r7, 453
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 133
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

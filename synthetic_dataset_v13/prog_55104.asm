; DESCRIPTION: Composite: Places a purple circle of radius 22 at center (329, 231) then Draws a blue rectangle at (203, 123) with width 27 and height 112 then Renders a red line between points (200, 79) and (415, 30).
; PLAN: r0=329(x), r1=231(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=123(y), r7=27(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x1), r11=79(y1), r12=415(x2), r13=30(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 231
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 123
LDI r7, 27
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 79
LDI r12, 415
LDI r13, 30
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

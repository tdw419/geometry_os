; DESCRIPTION: Composite: Places a white 97x84 rectangle at position (403, 23) then Renders a magenta line between points (485, 69) and (338, 246) then Draws a purple circle centered at (79, 241) with radius 15.
; PLAN: r0=403(x), r1=23(y), r2=97(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x1), r6=69(y1), r7=338(x2), r8=246(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=241(y), r12=15(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 23
LDI r2, 97
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 69
LDI r7, 338
LDI r8, 246
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 241
LDI r12, 15
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

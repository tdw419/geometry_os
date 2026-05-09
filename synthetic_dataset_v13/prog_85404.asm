; DESCRIPTION: Composite: Places a purple line segment connecting (499, 124) to (33, 255) then Places a magenta 112x101 rectangle at position (346, 20) then Renders a white disk with center (158, 79) and radius 55.
; PLAN: r0=499(x1), r1=124(y1), r2=33(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=20(y), r7=112(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=79(y), r12=55(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 124
LDI r2, 33
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 20
LDI r7, 112
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 79
LDI r12, 55
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

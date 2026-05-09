; DESCRIPTION: Composite: Places a blue 72x95 rectangle at position (300, 78) then Places a white line segment connecting (67, 168) to (464, 183) then Draws a white circle centered at (347, 152) with radius 46.
; PLAN: r0=300(x), r1=78(y), r2=72(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x1), r6=168(y1), r7=464(x2), r8=183(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=152(y), r12=46(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 78
LDI r2, 72
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 168
LDI r7, 464
LDI r8, 183
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 152
LDI r12, 46
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

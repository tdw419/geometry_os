; DESCRIPTION: Composite: Sets a single magenta pixel at (87, 180) then Places a orange line segment connecting (237, 78) to (315, 142) then Draws a white rectangle at (136, 122) with width 118 and height 103.
; PLAN: r0=87(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=78(y1), r7=315(x2), r8=142(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=136(x), r11=122(y), r12=118(width), r13=103(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 180
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 78
LDI r7, 315
LDI r8, 142
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 122
LDI r12, 118
LDI r13, 103
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

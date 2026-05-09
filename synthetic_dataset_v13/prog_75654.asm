; DESCRIPTION: Composite: Places a yellow dot at position (217, 107) then Places a blue line segment connecting (232, 11) to (464, 180) then Draws a magenta rectangle at (188, 149) with width 103 and height 14.
; PLAN: r0=217(x), r1=107(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=11(y1), r7=464(x2), r8=180(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=149(y), r12=103(width), r13=14(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 107
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 232
LDI r6, 11
LDI r7, 464
LDI r8, 180
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 149
LDI r12, 103
LDI r13, 14
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

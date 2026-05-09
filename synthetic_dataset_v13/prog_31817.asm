; DESCRIPTION: Composite: Places a yellow 55x23 rectangle at position (444, 126) then Draws a green circle centered at (226, 109) with radius 73 then Renders a magenta line between points (220, 203) and (104, 133).
; PLAN: r0=444(x), r1=126(y), r2=55(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=109(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x1), r11=203(y1), r12=104(x2), r13=133(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 126
LDI r2, 55
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 109
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 203
LDI r12, 104
LDI r13, 133
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

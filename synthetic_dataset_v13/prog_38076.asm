; DESCRIPTION: Composite: Places a yellow 116x109 rectangle at position (130, 136) then Draws a green circle centered at (345, 186) with radius 68 then Places a magenta line segment connecting (196, 235) to (258, 158).
; PLAN: r0=130(x), r1=136(y), r2=116(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=186(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x1), r11=235(y1), r12=258(x2), r13=158(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 136
LDI r2, 116
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 186
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 235
LDI r12, 258
LDI r13, 158
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

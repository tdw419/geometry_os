; DESCRIPTION: Composite: Renders a orange line between points (162, 132) and (121, 131) then Draws a red circle centered at (235, 103) with radius 55 then Draws a black rectangle at (117, 68) with width 16 and height 107.
; PLAN: r0=162(x1), r1=132(y1), r2=121(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=103(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=68(y), r12=16(width), r13=107(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 132
LDI r2, 121
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 103
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 68
LDI r12, 16
LDI r13, 107
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Draws a yellow circle centered at (99, 142) with radius 79 then Places a magenta line segment connecting (210, 138) to (478, 109) then Places a red 108x44 rectangle at position (142, 147).
; PLAN: r0=99(x), r1=142(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=138(y1), r7=478(x2), r8=109(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=147(y), r12=108(width), r13=44(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 142
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 138
LDI r7, 478
LDI r8, 109
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 147
LDI r12, 108
LDI r13, 44
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

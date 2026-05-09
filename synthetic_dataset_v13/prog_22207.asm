; DESCRIPTION: Composite: Creates a magenta circular shape at (413, 160) with radius 74 then Draws a purple rectangle at (162, 108) with width 63 and height 55 then Renders a magenta line between points (356, 60) and (333, 147).
; PLAN: r0=413(x), r1=160(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=108(y), r7=63(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x1), r11=60(y1), r12=333(x2), r13=147(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 160
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 108
LDI r7, 63
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 60
LDI r12, 333
LDI r13, 147
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

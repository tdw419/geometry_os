; DESCRIPTION: Composite: Draws a yellow rectangle at (268, 63) with width 19 and height 95 then Renders a magenta disk with center (236, 84) and radius 16 then Places a black line segment connecting (416, 131) to (130, 121).
; PLAN: r0=268(x), r1=63(y), r2=19(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=84(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=416(x1), r11=131(y1), r12=130(x2), r13=121(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 63
LDI r2, 19
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 84
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 416
LDI r11, 131
LDI r12, 130
LDI r13, 121
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

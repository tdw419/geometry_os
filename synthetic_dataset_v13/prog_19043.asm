; DESCRIPTION: Composite: Draws a magenta rectangle at (166, 165) with width 92 and height 31 then Renders a cyan disk with center (229, 135) and radius 72 then Places a yellow line segment connecting (41, 209) to (476, 74).
; PLAN: r0=166(x), r1=165(y), r2=92(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=135(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x1), r11=209(y1), r12=476(x2), r13=74(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 165
LDI r2, 92
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 135
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 209
LDI r12, 476
LDI r13, 74
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

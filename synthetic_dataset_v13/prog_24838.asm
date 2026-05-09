; DESCRIPTION: Composite: Draws a orange rectangle at (22, 195) with width 51 and height 10 then Creates a red circular shape at (222, 164) with radius 68 then Renders a white line between points (333, 173) and (392, 191).
; PLAN: r0=22(x), r1=195(y), r2=51(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=164(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x1), r11=173(y1), r12=392(x2), r13=191(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 195
LDI r2, 51
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 164
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 173
LDI r12, 392
LDI r13, 191
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Renders a blue disk with center (82, 181) and radius 40 then Creates a orange rectangular region at (333, 88) spanning 119 by 16 pixels then Draws a red line from (367, 237) to (172, 54).
; PLAN: r0=82(x), r1=181(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=88(y), r7=119(width), r8=16(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x1), r11=237(y1), r12=172(x2), r13=54(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 181
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 88
LDI r7, 119
LDI r8, 16
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 237
LDI r12, 172
LDI r13, 54
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

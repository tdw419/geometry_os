; DESCRIPTION: Composite: Renders a magenta disk with center (433, 153) and radius 41 then Creates a purple rectangular region at (58, 65) spanning 42 by 41 pixels then Draws a orange line from (133, 209) to (503, 147).
; PLAN: r0=433(x), r1=153(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=65(y), r7=42(width), r8=41(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x1), r11=209(y1), r12=503(x2), r13=147(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 153
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 65
LDI r7, 42
LDI r8, 41
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 209
LDI r12, 503
LDI r13, 147
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

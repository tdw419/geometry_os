; DESCRIPTION: Composite: Creates a magenta rectangular region at (384, 63) spanning 29 by 103 pixels then Renders a purple disk with center (42, 75) and radius 23 then Draws a orange line from (162, 153) to (109, 226).
; PLAN: r0=384(x), r1=63(y), r2=29(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x), r6=75(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x1), r11=153(y1), r12=109(x2), r13=226(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 63
LDI r2, 29
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 75
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 153
LDI r12, 109
LDI r13, 226
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

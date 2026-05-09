; DESCRIPTION: Composite: Draws a yellow rectangle at (98, 65) with width 118 and height 10 then Renders a black disk with center (406, 174) and radius 44 then Renders a magenta line between points (429, 152) and (464, 227).
; PLAN: r0=98(x), r1=65(y), r2=118(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x), r6=174(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x1), r11=152(y1), r12=464(x2), r13=227(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 65
LDI r2, 118
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 174
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 152
LDI r12, 464
LDI r13, 227
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

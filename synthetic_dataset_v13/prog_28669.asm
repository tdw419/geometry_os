; DESCRIPTION: Composite: Places a red circle of radius 22 at center (96, 174) then Creates a red rectangular region at (409, 66) spanning 84 by 90 pixels then Renders a blue line between points (464, 40) and (136, 42).
; PLAN: r0=96(x), r1=174(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=66(y), r7=84(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x1), r11=40(y1), r12=136(x2), r13=42(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 174
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 66
LDI r7, 84
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 40
LDI r12, 136
LDI r13, 42
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

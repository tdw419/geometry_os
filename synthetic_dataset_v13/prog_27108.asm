; DESCRIPTION: Composite: Draws a purple circle centered at (196, 136) with radius 74 then Creates a purple rectangular region at (240, 28) spanning 100 by 85 pixels then Renders a cyan line between points (94, 23) and (95, 189).
; PLAN: r0=196(x), r1=136(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=28(y), r7=100(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x1), r11=23(y1), r12=95(x2), r13=189(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 136
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 28
LDI r7, 100
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 23
LDI r12, 95
LDI r13, 189
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT

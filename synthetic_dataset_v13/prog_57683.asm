; DESCRIPTION: Composite: Creates a magenta rectangular region at (270, 140) spanning 96 by 98 pixels then Draws a orange circle centered at (295, 99) with radius 74 then Renders a white line between points (157, 63) and (86, 2).
; PLAN: r0=270(x), r1=140(y), r2=96(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=99(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x1), r11=63(y1), r12=86(x2), r13=2(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 140
LDI r2, 96
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 99
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 63
LDI r12, 86
LDI r13, 2
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT

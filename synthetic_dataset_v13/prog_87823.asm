; DESCRIPTION: Composite: Renders a blue line between points (140, 148) and (460, 151) then Draws a purple circle centered at (211, 170) with radius 75 then Renders a blue box of size 86x108 starting at (188, 63).
; PLAN: r0=140(x1), r1=148(y1), r2=460(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=170(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x), r11=63(y), r12=86(width), r13=108(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 148
LDI r2, 460
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 170
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 63
LDI r12, 86
LDI r13, 108
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

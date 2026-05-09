; DESCRIPTION: Composite: Renders a green disk with center (286, 197) and radius 12 then Draws a magenta rectangle at (377, 68) with width 80 and height 105 then Renders a yellow line between points (142, 193) and (448, 127).
; PLAN: r0=286(x), r1=197(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=68(y), r7=80(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x1), r11=193(y1), r12=448(x2), r13=127(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 197
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 68
LDI r7, 80
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 193
LDI r12, 448
LDI r13, 127
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

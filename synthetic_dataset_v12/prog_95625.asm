; DESCRIPTION: Composite: Places a purple 48x46 rectangle at position (142, 13) then Renders a magenta line between points (63, 150) and (492, 2) then Renders a blue disk with center (163, 113) and radius 29.
; PLAN: r0=142(x), r1=13(y), r2=48(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x1), r6=150(y1), r7=492(x2), r8=2(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=163(x), r11=113(y), r12=29(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 13
LDI r2, 48
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 150
LDI r7, 492
LDI r8, 2
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 113
LDI r12, 29
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

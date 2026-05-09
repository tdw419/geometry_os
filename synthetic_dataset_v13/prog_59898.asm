; DESCRIPTION: Composite: Places a purple 27x114 rectangle at position (196, 140) then Places a orange circle of radius 24 at center (136, 92) then Renders a red line between points (47, 105) and (144, 199).
; PLAN: r0=196(x), r1=140(y), r2=27(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=92(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x1), r11=105(y1), r12=144(x2), r13=199(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 140
LDI r2, 27
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 92
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 105
LDI r12, 144
LDI r13, 199
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

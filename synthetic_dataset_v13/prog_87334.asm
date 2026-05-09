; DESCRIPTION: Composite: Places a red line segment connecting (175, 73) to (256, 136) then Sets a single orange pixel at (112, 183) then Draws a magenta rectangle at (159, 112) with width 10 and height 101.
; PLAN: r0=175(x1), r1=73(y1), r2=256(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=183(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=112(y), r12=10(width), r13=101(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 73
LDI r2, 256
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 183
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 159
LDI r11, 112
LDI r12, 10
LDI r13, 101
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

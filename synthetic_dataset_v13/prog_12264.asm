; DESCRIPTION: Composite: Places a white line segment connecting (148, 158) to (434, 145) then Renders a magenta disk with center (257, 130) and radius 61 then Draws a blue rectangle at (36, 202) with width 116 and height 33.
; PLAN: r0=148(x1), r1=158(y1), r2=434(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=130(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x), r11=202(y), r12=116(width), r13=33(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 158
LDI r2, 434
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 130
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 202
LDI r12, 116
LDI r13, 33
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

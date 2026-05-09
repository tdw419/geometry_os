; DESCRIPTION: Composite: Draws a purple rectangle at (461, 88) with width 36 and height 91 then Renders a magenta disk with center (213, 151) and radius 77 then Places a yellow line segment connecting (98, 17) to (359, 218).
; PLAN: r0=461(x), r1=88(y), r2=36(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=151(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x1), r11=17(y1), r12=359(x2), r13=218(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 88
LDI r2, 36
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 151
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 17
LDI r12, 359
LDI r13, 218
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

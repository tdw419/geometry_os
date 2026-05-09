; DESCRIPTION: Composite: Draws a green circle centered at (236, 161) with radius 43 then Sets a single blue pixel at (435, 115) then Draws a magenta rectangle at (155, 51) with width 105 and height 44.
; PLAN: r0=236(x), r1=161(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=115(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=155(x), r11=51(y), r12=105(width), r13=44(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 161
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 115
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 155
LDI r11, 51
LDI r12, 105
LDI r13, 44
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

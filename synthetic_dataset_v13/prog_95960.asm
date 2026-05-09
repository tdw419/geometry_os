; DESCRIPTION: Composite: Places a blue circle of radius 18 at center (329, 188) then Sets a single purple pixel at (431, 96) then Draws a magenta rectangle at (385, 105) with width 11 and height 97.
; PLAN: r0=329(x), r1=188(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=96(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=105(y), r12=11(width), r13=97(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 188
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 96
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 385
LDI r11, 105
LDI r12, 11
LDI r13, 97
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

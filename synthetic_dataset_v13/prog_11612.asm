; DESCRIPTION: Composite: Draws a purple rectangle at (463, 59) with width 10 and height 22 then Renders a magenta disk with center (407, 53) and radius 53 then Places a red dot at position (56, 22).
; PLAN: r0=463(x), r1=59(y), r2=10(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=53(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=56(x), r11=22(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 59
LDI r2, 10
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 53
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 56
LDI r11, 22
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Places a orange circle of radius 51 at center (190, 116) then Places a blue dot at position (151, 178) then Draws a green rectangle at (93, 160) with width 54 and height 64.
; PLAN: r0=190(x), r1=116(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=178(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=93(x), r11=160(y), r12=54(width), r13=64(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 116
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 178
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 93
LDI r11, 160
LDI r12, 54
LDI r13, 64
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Draws a magenta rectangle at (100, 96) with width 39 and height 93 then Places a black dot at position (169, 144) then Creates a blue circular shape at (353, 23) with radius 12.
; PLAN: r0=100(x), r1=96(y), r2=39(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=144(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=353(x), r11=23(y), r12=12(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 100
LDI r1, 96
LDI r2, 39
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 144
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 353
LDI r11, 23
LDI r12, 12
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

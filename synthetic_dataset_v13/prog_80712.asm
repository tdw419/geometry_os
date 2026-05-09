; DESCRIPTION: Composite: Creates a red rectangular region at (131, 114) spanning 99 by 63 pixels then Places a black dot at position (151, 14) then Draws a purple circle centered at (96, 78) with radius 67.
; PLAN: r0=131(x), r1=114(y), r2=99(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=14(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=78(y), r12=67(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 114
LDI r2, 99
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 14
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 96
LDI r11, 78
LDI r12, 67
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

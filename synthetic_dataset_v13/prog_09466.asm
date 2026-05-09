; DESCRIPTION: Composite: Renders a magenta box of size 47x78 starting at (376, 76) then Sets a single orange pixel at (510, 114) then Draws a purple circle centered at (262, 142) with radius 44.
; PLAN: r0=376(x), r1=76(y), r2=47(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x), r6=114(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=262(x), r11=142(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 76
LDI r2, 47
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 114
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 262
LDI r11, 142
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

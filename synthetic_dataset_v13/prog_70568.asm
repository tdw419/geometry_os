; DESCRIPTION: Composite: Creates a black rectangular region at (314, 17) spanning 59 by 114 pixels then Sets a single red pixel at (174, 63) then Draws a yellow circle centered at (150, 195) with radius 51.
; PLAN: r0=314(x), r1=17(y), r2=59(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=63(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=150(x), r11=195(y), r12=51(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 17
LDI r2, 59
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 63
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 150
LDI r11, 195
LDI r12, 51
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

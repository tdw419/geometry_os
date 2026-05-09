; DESCRIPTION: Composite: Places a black dot at position (506, 16) then Draws a magenta circle centered at (221, 155) with radius 53 then Draws a blue line from (318, 76) to (43, 132).
; PLAN: r0=506(x), r1=16(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=155(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x1), r11=76(y1), r12=43(x2), r13=132(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 16
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 221
LDI r6, 155
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 76
LDI r12, 43
LDI r13, 132
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

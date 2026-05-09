; DESCRIPTION: Composite: Places a magenta circle of radius 51 at center (140, 126) then Places a red dot at position (316, 199) then Creates a yellow rectangular region at (235, 121) spanning 48 by 83 pixels.
; PLAN: r0=140(x), r1=126(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=199(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=121(y), r12=48(width), r13=83(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 126
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 199
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 235
LDI r11, 121
LDI r12, 48
LDI r13, 83
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

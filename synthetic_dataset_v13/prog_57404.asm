; DESCRIPTION: Composite: Places a white 43x51 rectangle at position (116, 167) then Sets a single blue pixel at (267, 246) then Creates a green circular shape at (393, 92) with radius 41.
; PLAN: r0=116(x), r1=167(y), r2=43(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=246(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=92(y), r12=41(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 167
LDI r2, 43
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 246
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 393
LDI r11, 92
LDI r12, 41
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

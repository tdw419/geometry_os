; DESCRIPTION: Composite: Draws a magenta rectangle at (389, 45) with width 82 and height 97 then Creates a blue circular shape at (236, 85) with radius 72 then Sets a single blue pixel at (171, 100).
; PLAN: r0=389(x), r1=45(y), r2=82(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=85(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=100(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 45
LDI r2, 82
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 85
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 100
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

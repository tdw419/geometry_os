; DESCRIPTION: Composite: Places a orange dot at position (26, 235) then Draws a purple circle centered at (32, 179) with radius 10 then Draws a magenta rectangle at (431, 81) with width 73 and height 104.
; PLAN: r0=26(x), r1=235(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=179(y), r7=10(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=81(y), r12=73(width), r13=104(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 235
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 32
LDI r6, 179
LDI r7, 10
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 81
LDI r12, 73
LDI r13, 104
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

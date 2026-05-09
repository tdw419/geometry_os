; DESCRIPTION: Composite: Draws a blue circle centered at (257, 202) with radius 19 then Creates a magenta rectangular region at (385, 171) spanning 107 by 56 pixels then Places a orange dot at position (35, 152).
; PLAN: r0=257(x), r1=202(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=171(y), r7=107(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=35(x), r11=152(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 202
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 171
LDI r7, 107
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 152
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

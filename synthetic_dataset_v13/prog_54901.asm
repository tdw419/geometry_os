; DESCRIPTION: Composite: Creates a red rectangular region at (361, 49) spanning 14 by 76 pixels then Creates a magenta circular shape at (163, 184) with radius 36 then Places a black dot at position (39, 63).
; PLAN: r0=361(x), r1=49(y), r2=14(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=184(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x), r11=63(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 49
LDI r2, 14
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 184
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 63
LDI r12, 0x000000
PSET r10, r11, r12
HALT

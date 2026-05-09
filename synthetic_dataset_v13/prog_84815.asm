; DESCRIPTION: Composite: Sets a single blue pixel at (433, 57) then Creates a green rectangular region at (227, 85) spanning 62 by 114 pixels then Creates a magenta circular shape at (257, 82) with radius 59.
; PLAN: r0=433(x), r1=57(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=85(y), r7=62(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=82(y), r12=59(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 57
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 85
LDI r7, 62
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 82
LDI r12, 59
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

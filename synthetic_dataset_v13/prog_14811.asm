; DESCRIPTION: Composite: Places a orange dot at position (257, 192) then Places a magenta 66x49 rectangle at position (62, 109) then Creates a blue circular shape at (335, 146) with radius 18.
; PLAN: r0=257(x), r1=192(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=109(y), r7=66(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=146(y), r12=18(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 192
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 62
LDI r6, 109
LDI r7, 66
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 146
LDI r12, 18
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

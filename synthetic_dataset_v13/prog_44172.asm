; DESCRIPTION: Composite: Sets a single blue pixel at (26, 49) then Places a orange 103x111 rectangle at position (351, 14) then Creates a yellow circular shape at (245, 168) with radius 56.
; PLAN: r0=26(x), r1=49(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=14(y), r7=103(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=168(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 49
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 351
LDI r6, 14
LDI r7, 103
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 168
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

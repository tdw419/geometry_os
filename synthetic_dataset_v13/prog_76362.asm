; DESCRIPTION: Composite: Draws a black rectangle at (283, 62) with width 87 and height 14 then Places a orange dot at position (219, 30) then Creates a blue circular shape at (378, 131) with radius 63.
; PLAN: r0=283(x), r1=62(y), r2=87(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=30(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=131(y), r12=63(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 62
LDI r2, 87
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 30
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 378
LDI r11, 131
LDI r12, 63
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

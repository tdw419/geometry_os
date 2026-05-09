; DESCRIPTION: Composite: Places a blue 90x46 rectangle at position (239, 3) then Sets a single blue pixel at (308, 123) then Renders a orange disk with center (396, 102) and radius 43.
; PLAN: r0=239(x), r1=3(y), r2=90(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=123(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=102(y), r12=43(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 239
LDI r1, 3
LDI r2, 90
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 123
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 102
LDI r12, 43
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

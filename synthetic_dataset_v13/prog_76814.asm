; DESCRIPTION: Composite: Places a white 114x106 rectangle at position (256, 137) then Sets a single orange pixel at (332, 232) then Draws a purple circle centered at (392, 45) with radius 28.
; PLAN: r0=256(x), r1=137(y), r2=114(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=232(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=392(x), r11=45(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 137
LDI r2, 114
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 232
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 392
LDI r11, 45
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

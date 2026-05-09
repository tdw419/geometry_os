; DESCRIPTION: Composite: Places a purple circle of radius 23 at center (43, 71) then Sets a single orange pixel at (356, 246) then Creates a black rectangular region at (86, 63) spanning 57 by 50 pixels.
; PLAN: r0=43(x), r1=71(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=246(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=63(y), r12=57(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 71
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 246
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 86
LDI r11, 63
LDI r12, 57
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

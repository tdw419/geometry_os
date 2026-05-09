; DESCRIPTION: Composite: Renders a yellow disk with center (109, 109) and radius 53 then Sets a single green pixel at (498, 28) then Creates a magenta rectangular region at (392, 56) spanning 62 by 88 pixels.
; PLAN: r0=109(x), r1=109(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=392(x), r11=56(y), r12=62(width), r13=88(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 109
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 392
LDI r11, 56
LDI r12, 62
LDI r13, 88
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

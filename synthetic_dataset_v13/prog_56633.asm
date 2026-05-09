; DESCRIPTION: Composite: Renders a magenta box of size 62x31 starting at (55, 42) then Creates a orange circular shape at (236, 181) with radius 72 then Sets a single blue pixel at (43, 244).
; PLAN: r0=55(x), r1=42(y), r2=62(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=181(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x), r11=244(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 42
LDI r2, 62
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 181
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 244
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

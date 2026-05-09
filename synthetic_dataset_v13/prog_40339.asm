; DESCRIPTION: Composite: Creates a white circular shape at (262, 167) with radius 23 then Sets a single magenta pixel at (181, 19) then Creates a green rectangular region at (265, 94) spanning 31 by 101 pixels.
; PLAN: r0=262(x), r1=167(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=19(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=94(y), r12=31(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 167
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 19
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 265
LDI r11, 94
LDI r12, 31
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

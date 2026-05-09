; DESCRIPTION: Composite: Creates a purple rectangular region at (81, 130) spanning 32 by 99 pixels then Creates a black circular shape at (391, 88) with radius 55 then Places a white dot at position (509, 238).
; PLAN: r0=81(x), r1=130(y), r2=32(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=88(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x), r11=238(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 130
LDI r2, 32
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 88
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 238
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT

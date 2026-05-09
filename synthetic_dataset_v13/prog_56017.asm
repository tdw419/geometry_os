; DESCRIPTION: Composite: Creates a yellow rectangular region at (128, 78) spanning 50 by 48 pixels then Renders a white disk with center (381, 113) and radius 29 then Sets a single magenta pixel at (64, 10).
; PLAN: r0=128(x), r1=78(y), r2=50(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=113(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=10(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 78
LDI r2, 50
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 113
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 10
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

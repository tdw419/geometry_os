; DESCRIPTION: Composite: Places a orange dot at position (384, 189) then Renders a black disk with center (160, 85) and radius 78 then Renders a red box of size 81x108 starting at (396, 29).
; PLAN: r0=384(x), r1=189(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=85(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=29(y), r12=81(width), r13=108(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 189
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 160
LDI r6, 85
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 29
LDI r12, 81
LDI r13, 108
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

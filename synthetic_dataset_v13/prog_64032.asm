; DESCRIPTION: Composite: Sets a single blue pixel at (27, 126) then Creates a magenta circular shape at (360, 115) with radius 71 then Creates a orange rectangular region at (149, 67) spanning 76 by 54 pixels.
; PLAN: r0=27(x), r1=126(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=115(y), r7=71(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=67(y), r12=76(width), r13=54(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 126
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 115
LDI r7, 71
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 67
LDI r12, 76
LDI r13, 54
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

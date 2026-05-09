; DESCRIPTION: Composite: Creates a white circular shape at (353, 113) with radius 35 then Sets a single yellow pixel at (483, 213) then Creates a magenta rectangular region at (63, 56) spanning 77 by 78 pixels.
; PLAN: r0=353(x), r1=113(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=213(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=63(x), r11=56(y), r12=77(width), r13=78(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 113
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 213
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 63
LDI r11, 56
LDI r12, 77
LDI r13, 78
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

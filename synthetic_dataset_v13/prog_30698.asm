; DESCRIPTION: Composite: Renders a black disk with center (346, 184) and radius 57 then Creates a magenta rectangular region at (263, 98) spanning 86 by 64 pixels then Sets a single blue pixel at (21, 45).
; PLAN: r0=346(x), r1=184(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=98(y), r7=86(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=21(x), r11=45(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 184
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 98
LDI r7, 86
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 45
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Places a magenta dot at position (484, 113) then Creates a black circular shape at (362, 81) with radius 63 then Creates a white rectangular region at (384, 209) spanning 81 by 17 pixels.
; PLAN: r0=484(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=81(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x), r11=209(y), r12=81(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 113
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 362
LDI r6, 81
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 209
LDI r12, 81
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

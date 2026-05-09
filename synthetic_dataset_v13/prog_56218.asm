; DESCRIPTION: Composite: Sets a single magenta pixel at (460, 201) then Creates a green circular shape at (408, 128) with radius 71 then Draws a red rectangle at (401, 173) with width 15 and height 57.
; PLAN: r0=460(x), r1=201(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=128(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x), r11=173(y), r12=15(width), r13=57(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 460
LDI r1, 201
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 128
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 173
LDI r12, 15
LDI r13, 57
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

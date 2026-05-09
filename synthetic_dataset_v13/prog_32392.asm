; DESCRIPTION: Composite: Draws a magenta rectangle at (346, 90) with width 58 and height 64 then Creates a magenta circular shape at (260, 171) with radius 16 then Sets a single magenta pixel at (481, 227).
; PLAN: r0=346(x), r1=90(y), r2=58(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=171(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=481(x), r11=227(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 90
LDI r2, 58
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 171
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 481
LDI r11, 227
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

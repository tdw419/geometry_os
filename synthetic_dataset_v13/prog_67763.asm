; DESCRIPTION: Composite: Draws a orange circle centered at (349, 112) with radius 16 then Sets a single blue pixel at (173, 100) then Renders a blue box of size 57x64 starting at (426, 62).
; PLAN: r0=349(x), r1=112(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=100(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=426(x), r11=62(y), r12=57(width), r13=64(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 112
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 100
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 426
LDI r11, 62
LDI r12, 57
LDI r13, 64
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

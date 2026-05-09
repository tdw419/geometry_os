; DESCRIPTION: Composite: Sets a single blue pixel at (236, 100) then Draws a blue circle centered at (429, 150) with radius 59 then Creates a white rectangular region at (22, 28) spanning 62 by 50 pixels.
; PLAN: r0=236(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=150(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=28(y), r12=62(width), r13=50(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 150
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 28
LDI r12, 62
LDI r13, 50
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Creates a black rectangular region at (112, 140) spanning 72 by 40 pixels then Draws a red circle centered at (325, 107) with radius 56 then Sets a single blue pixel at (214, 253).
; PLAN: r0=112(x), r1=140(y), r2=72(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=107(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=214(x), r11=253(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 140
LDI r2, 72
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 107
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 214
LDI r11, 253
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

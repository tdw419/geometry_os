; DESCRIPTION: Composite: Creates a white rectangular region at (421, 208) spanning 47 by 47 pixels then Draws a black circle centered at (319, 147) with radius 79 then Sets a single magenta pixel at (169, 96).
; PLAN: r0=421(x), r1=208(y), r2=47(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=147(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=96(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 208
LDI r2, 47
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 147
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 96
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

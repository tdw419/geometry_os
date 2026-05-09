; DESCRIPTION: Composite: Creates a green rectangular region at (133, 157) spanning 29 by 87 pixels then Sets a single magenta pixel at (191, 52) then Creates a green circular shape at (354, 174) with radius 21.
; PLAN: r0=133(x), r1=157(y), r2=29(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=52(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=174(y), r12=21(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 157
LDI r2, 29
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 52
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 354
LDI r11, 174
LDI r12, 21
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

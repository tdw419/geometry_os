; DESCRIPTION: Composite: Sets a single black pixel at (448, 252) then Renders a green disk with center (341, 181) and radius 61 then Creates a orange rectangular region at (78, 28) spanning 23 by 23 pixels.
; PLAN: r0=448(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=181(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=78(x), r11=28(y), r12=23(width), r13=23(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 181
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 78
LDI r11, 28
LDI r12, 23
LDI r13, 23
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

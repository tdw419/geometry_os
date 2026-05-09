; DESCRIPTION: Composite: Sets a single black pixel at (135, 204) then Creates a green rectangular region at (17, 78) spanning 103 by 35 pixels then Renders a black disk with center (331, 108) and radius 63.
; PLAN: r0=135(x), r1=204(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=78(y), r7=103(width), r8=35(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x), r11=108(y), r12=63(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 204
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 17
LDI r6, 78
LDI r7, 103
LDI r8, 35
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 108
LDI r12, 63
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

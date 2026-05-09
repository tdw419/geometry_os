; DESCRIPTION: Composite: Draws a white line from (254, 169) to (42, 113) then Places a black dot at position (83, 232) then Creates a green rectangular region at (348, 156) spanning 58 by 45 pixels.
; PLAN: r0=254(x1), r1=169(y1), r2=42(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=232(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=156(y), r12=58(width), r13=45(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 169
LDI r2, 42
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 232
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 348
LDI r11, 156
LDI r12, 58
LDI r13, 45
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

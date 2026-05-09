; DESCRIPTION: Composite: Places a yellow dot at position (405, 35) then Creates a blue rectangular region at (263, 113) spanning 43 by 14 pixels then Draws a white circle centered at (259, 147) with radius 79.
; PLAN: r0=405(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=113(y), r7=43(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=147(y), r12=79(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 405
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 263
LDI r6, 113
LDI r7, 43
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 147
LDI r12, 79
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

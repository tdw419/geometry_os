; DESCRIPTION: Composite: Draws a white circle centered at (272, 181) with radius 61 then Creates a green rectangular region at (234, 180) spanning 61 by 49 pixels then Places a cyan dot at position (71, 88).
; PLAN: r0=272(x), r1=181(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=180(y), r7=61(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=88(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 181
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 180
LDI r7, 61
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 88
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

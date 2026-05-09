; DESCRIPTION: Composite: Draws a black circle centered at (265, 163) with radius 76 then Creates a orange rectangular region at (336, 105) spanning 105 by 90 pixels then Draws a yellow line from (119, 19) to (458, 68).
; PLAN: r0=265(x), r1=163(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=105(y), r7=105(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x1), r11=19(y1), r12=458(x2), r13=68(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 163
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 105
LDI r7, 105
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 19
LDI r12, 458
LDI r13, 68
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT

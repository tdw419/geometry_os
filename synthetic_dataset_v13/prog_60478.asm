; DESCRIPTION: Composite: Creates a purple rectangular region at (396, 102) spanning 113 by 116 pixels then Sets a single green pixel at (230, 19) then Draws a purple circle centered at (85, 75) with radius 68.
; PLAN: r0=396(x), r1=102(y), r2=113(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=19(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=75(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 102
LDI r2, 113
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 19
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 85
LDI r11, 75
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

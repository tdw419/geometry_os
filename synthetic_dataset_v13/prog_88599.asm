; DESCRIPTION: Composite: Creates a orange rectangular region at (341, 160) spanning 75 by 88 pixels then Places a purple dot at position (324, 213) then Draws a purple circle centered at (215, 121) with radius 59.
; PLAN: r0=341(x), r1=160(y), r2=75(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=213(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=121(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 341
LDI r1, 160
LDI r2, 75
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 213
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 121
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

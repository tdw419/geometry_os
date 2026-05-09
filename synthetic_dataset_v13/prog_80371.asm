; DESCRIPTION: Composite: Creates a white rectangular region at (203, 72) spanning 119 by 11 pixels then Places a blue dot at position (258, 112) then Draws a purple circle centered at (203, 157) with radius 72.
; PLAN: r0=203(x), r1=72(y), r2=119(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=112(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=157(y), r12=72(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 72
LDI r2, 119
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 112
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 157
LDI r12, 72
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

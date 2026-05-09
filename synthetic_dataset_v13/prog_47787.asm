; DESCRIPTION: Composite: Places a yellow 105x88 rectangle at position (104, 124) then Sets a single black pixel at (245, 250) then Draws a green circle centered at (456, 72) with radius 15.
; PLAN: r0=104(x), r1=124(y), r2=105(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=250(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=456(x), r11=72(y), r12=15(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 124
LDI r2, 105
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 250
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 456
LDI r11, 72
LDI r12, 15
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

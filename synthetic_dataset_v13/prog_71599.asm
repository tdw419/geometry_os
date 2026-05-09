; DESCRIPTION: Composite: Renders a white disk with center (106, 148) and radius 44 then Sets a single black pixel at (122, 45) then Draws a red rectangle at (151, 49) with width 43 and height 20.
; PLAN: r0=106(x), r1=148(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=45(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=151(x), r11=49(y), r12=43(width), r13=20(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 148
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 45
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 151
LDI r11, 49
LDI r12, 43
LDI r13, 20
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

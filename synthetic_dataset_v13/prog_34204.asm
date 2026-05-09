; DESCRIPTION: Composite: Draws a white rectangle at (107, 55) with width 50 and height 44 then Creates a blue circular shape at (170, 152) with radius 75 then Sets a single black pixel at (496, 199).
; PLAN: r0=107(x), r1=55(y), r2=50(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=152(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x), r11=199(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 107
LDI r1, 55
LDI r2, 50
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 152
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 199
LDI r12, 0x000000
PSET r10, r11, r12
HALT

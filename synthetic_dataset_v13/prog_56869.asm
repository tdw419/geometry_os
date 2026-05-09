; DESCRIPTION: Composite: Places a white dot at position (430, 224) then Renders a yellow disk with center (428, 115) and radius 41 then Draws a green rectangle at (356, 66) with width 55 and height 101.
; PLAN: r0=430(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=115(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x), r11=66(y), r12=55(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 115
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 66
LDI r12, 55
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT

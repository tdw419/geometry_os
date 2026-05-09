; DESCRIPTION: Composite: Sets a single red pixel at (138, 164) then Draws a white rectangle at (253, 59) with width 55 and height 67 then Renders a black disk with center (172, 76) and radius 73.
; PLAN: r0=138(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=59(y), r7=55(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=76(y), r12=73(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 164
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 253
LDI r6, 59
LDI r7, 55
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 76
LDI r12, 73
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

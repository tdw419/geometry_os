; DESCRIPTION: Composite: Places a white dot at position (11, 141) then Renders a white disk with center (282, 175) and radius 61 then Draws a orange rectangle at (22, 99) with width 95 and height 99.
; PLAN: r0=11(x), r1=141(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=175(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=99(y), r12=95(width), r13=99(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 141
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 175
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 99
LDI r12, 95
LDI r13, 99
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

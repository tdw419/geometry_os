; DESCRIPTION: Composite: Renders a black disk with center (162, 174) and radius 63 then Places a purple dot at position (336, 23) then Draws a purple rectangle at (280, 1) with width 15 and height 20.
; PLAN: r0=162(x), r1=174(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=23(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=1(y), r12=15(width), r13=20(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 174
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 23
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 280
LDI r11, 1
LDI r12, 15
LDI r13, 20
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

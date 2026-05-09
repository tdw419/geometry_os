; DESCRIPTION: Composite: Draws a purple rectangle at (108, 234) with width 53 and height 19 then Places a blue dot at position (106, 179) then Renders a white disk with center (153, 72) and radius 67.
; PLAN: r0=108(x), r1=234(y), r2=53(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=179(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=153(x), r11=72(y), r12=67(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 234
LDI r2, 53
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 179
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 153
LDI r11, 72
LDI r12, 67
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

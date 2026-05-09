; DESCRIPTION: Composite: Draws a red rectangle at (51, 2) with width 70 and height 107 then Places a purple circle of radius 53 at center (396, 56) then Places a black dot at position (67, 56).
; PLAN: r0=51(x), r1=2(y), r2=70(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x), r6=56(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x), r11=56(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 2
LDI r2, 70
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 56
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 56
LDI r12, 0x000000
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Draws a blue rectangle at (464, 69) with width 29 and height 119 then Places a black dot at position (230, 237).
; PLAN: r0=464(x), r1=69(y), r2=29(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=237(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 464
LDI r1, 69
LDI r2, 29
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 237
LDI r7, 0x000000
PSET r5, r6, r7
HALT

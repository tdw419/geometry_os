; DESCRIPTION: Composite: Draws a blue rectangle at (227, 79) with width 38 and height 78 then Sets a single black pixel at (488, 67).
; PLAN: r0=227(x), r1=79(y), r2=38(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=67(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 227
LDI r1, 79
LDI r2, 38
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 67
LDI r7, 0x000000
PSET r5, r6, r7
HALT

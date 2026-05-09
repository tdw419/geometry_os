; DESCRIPTION: Draws a black rectangle at (232, 199) with width 70 and height 21.
; PLAN: r0=232(x), r1=199(y), r2=70(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 199
LDI r2, 70
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

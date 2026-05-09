; DESCRIPTION: Draws a black rectangle at (347, 72) with width 35 and height 60.
; PLAN: r0=347(x), r1=72(y), r2=35(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 72
LDI r2, 35
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

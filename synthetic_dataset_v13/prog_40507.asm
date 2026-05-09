; DESCRIPTION: Draws a black rectangle at (219, 81) with width 108 and height 103.
; PLAN: r0=219(x), r1=81(y), r2=108(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 81
LDI r2, 108
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

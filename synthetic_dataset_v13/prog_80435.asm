; DESCRIPTION: Draws a black rectangle at (122, 96) with width 63 and height 39.
; PLAN: r0=122(x), r1=96(y), r2=63(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 96
LDI r2, 63
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

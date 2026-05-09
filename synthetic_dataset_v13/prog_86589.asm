; DESCRIPTION: Draws a black rectangle at (431, 96) with width 45 and height 43.
; PLAN: r0=431(x), r1=96(y), r2=45(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 96
LDI r2, 45
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

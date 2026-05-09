; DESCRIPTION: Draws a black rectangle at (15, 122) with width 45 and height 96.
; PLAN: r0=15(x), r1=122(y), r2=45(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 122
LDI r2, 45
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black rectangle at (385, 96) with width 10 and height 116.
; PLAN: r0=385(x), r1=96(y), r2=10(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 96
LDI r2, 10
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

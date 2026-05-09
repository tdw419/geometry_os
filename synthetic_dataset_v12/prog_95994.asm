; DESCRIPTION: Draws a black rectangle at (4, 88) with width 113 and height 18.
; PLAN: r0=4(x), r1=88(y), r2=113(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 88
LDI r2, 113
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

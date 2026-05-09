; DESCRIPTION: Draws a black rectangle at (105, 189) with width 81 and height 14.
; PLAN: r0=105(x), r1=189(y), r2=81(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 189
LDI r2, 81
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

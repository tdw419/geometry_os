; DESCRIPTION: Draws a black rectangle at (54, 105) with width 87 and height 96.
; PLAN: r0=54(x), r1=105(y), r2=87(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 105
LDI r2, 87
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

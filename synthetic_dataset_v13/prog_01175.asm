; DESCRIPTION: Draws a black rectangle at (101, 35) with width 28 and height 77.
; PLAN: r0=101(x), r1=35(y), r2=28(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 35
LDI r2, 28
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

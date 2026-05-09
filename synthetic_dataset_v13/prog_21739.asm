; DESCRIPTION: Draws a black rectangle at (1, 150) with width 114 and height 49.
; PLAN: r0=1(x), r1=150(y), r2=114(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 150
LDI r2, 114
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

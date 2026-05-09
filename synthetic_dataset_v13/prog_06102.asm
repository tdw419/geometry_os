; DESCRIPTION: Draws a black rectangle at (383, 50) with width 114 and height 15.
; PLAN: r0=383(x), r1=50(y), r2=114(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 50
LDI r2, 114
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

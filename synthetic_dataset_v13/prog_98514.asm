; DESCRIPTION: Draws a black rectangle at (114, 20) with width 15 and height 20.
; PLAN: r0=114(x), r1=20(y), r2=15(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 20
LDI r2, 15
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

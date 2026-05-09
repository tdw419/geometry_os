; DESCRIPTION: Draws a purple rectangle at (15, 59) with width 114 and height 28.
; PLAN: r0=15(x), r1=59(y), r2=114(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 59
LDI r2, 114
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

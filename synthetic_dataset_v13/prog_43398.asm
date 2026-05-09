; DESCRIPTION: Draws a purple rectangle at (74, 122) with width 81 and height 59.
; PLAN: r0=74(x), r1=122(y), r2=81(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 122
LDI r2, 81
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

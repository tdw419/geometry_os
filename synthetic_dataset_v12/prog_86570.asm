; DESCRIPTION: Draws a purple rectangle at (81, 24) with width 26 and height 113.
; PLAN: r0=81(x), r1=24(y), r2=26(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 24
LDI r2, 26
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

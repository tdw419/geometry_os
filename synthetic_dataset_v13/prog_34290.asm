; DESCRIPTION: Draws a purple rectangle at (44, 35) with width 81 and height 103.
; PLAN: r0=44(x), r1=35(y), r2=81(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 35
LDI r2, 81
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

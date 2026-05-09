; DESCRIPTION: Draws a purple rectangle at (194, 113) with width 120 and height 67.
; PLAN: r0=194(x), r1=113(y), r2=120(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 113
LDI r2, 120
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple rectangle at (164, 12) with width 114 and height 113.
; PLAN: r0=164(x), r1=12(y), r2=114(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 12
LDI r2, 114
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

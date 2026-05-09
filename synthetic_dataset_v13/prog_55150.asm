; DESCRIPTION: Draws a purple rectangle at (173, 113) with width 101 and height 24.
; PLAN: r0=173(x), r1=113(y), r2=101(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 113
LDI r2, 101
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

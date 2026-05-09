; DESCRIPTION: Draws a purple rectangle at (240, 113) with width 83 and height 117.
; PLAN: r0=240(x), r1=113(y), r2=83(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 113
LDI r2, 83
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

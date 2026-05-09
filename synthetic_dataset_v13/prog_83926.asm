; DESCRIPTION: Draws a purple rectangle at (240, 18) with width 113 and height 109.
; PLAN: r0=240(x), r1=18(y), r2=113(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 18
LDI r2, 113
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

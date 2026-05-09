; DESCRIPTION: Draws a blue rectangle at (329, 53) with width 118 and height 19.
; PLAN: r0=329(x), r1=53(y), r2=118(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 53
LDI r2, 118
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

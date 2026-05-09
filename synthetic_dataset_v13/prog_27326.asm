; DESCRIPTION: Draws a purple rectangle at (53, 21) with width 74 and height 33.
; PLAN: r0=53(x), r1=21(y), r2=74(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 21
LDI r2, 74
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

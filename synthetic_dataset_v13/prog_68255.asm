; DESCRIPTION: Draws a purple rectangle at (396, 74) with width 53 and height 76.
; PLAN: r0=396(x), r1=74(y), r2=53(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 74
LDI r2, 53
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple rectangle at (421, 131) with width 53 and height 85.
; PLAN: r0=421(x), r1=131(y), r2=53(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 131
LDI r2, 53
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple rectangle at (67, 48) with width 76 and height 53.
; PLAN: r0=67(x), r1=48(y), r2=76(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 48
LDI r2, 76
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple rectangle at (356, 53) with width 68 and height 70.
; PLAN: r0=356(x), r1=53(y), r2=68(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 53
LDI r2, 68
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

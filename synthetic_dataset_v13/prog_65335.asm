; DESCRIPTION: Draws a blue rectangle at (76, 83) with width 103 and height 67.
; PLAN: r0=76(x), r1=83(y), r2=103(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 83
LDI r2, 103
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

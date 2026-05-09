; DESCRIPTION: Draws a blue rectangle at (326, 67) with width 69 and height 30.
; PLAN: r0=326(x), r1=67(y), r2=69(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 67
LDI r2, 69
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

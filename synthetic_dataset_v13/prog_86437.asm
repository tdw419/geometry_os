; DESCRIPTION: Renders a blue box of size 69x67 starting at (155, 80).
; PLAN: r0=155(x), r1=80(y), r2=69(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 80
LDI r2, 69
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

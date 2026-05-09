; DESCRIPTION: Renders a blue box of size 69x89 starting at (129, 67).
; PLAN: r0=129(x), r1=67(y), r2=69(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 67
LDI r2, 69
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

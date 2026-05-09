; DESCRIPTION: Renders a blue box of size 115x67 starting at (381, 78).
; PLAN: r0=381(x), r1=78(y), r2=115(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 78
LDI r2, 115
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

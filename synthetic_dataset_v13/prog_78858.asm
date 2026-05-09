; DESCRIPTION: Renders a blue box of size 69x118 starting at (343, 24).
; PLAN: r0=343(x), r1=24(y), r2=69(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 24
LDI r2, 69
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

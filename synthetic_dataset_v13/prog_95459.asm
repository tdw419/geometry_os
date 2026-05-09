; DESCRIPTION: Renders a blue box of size 117x118 starting at (6, 71).
; PLAN: r0=6(x), r1=71(y), r2=117(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 71
LDI r2, 117
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

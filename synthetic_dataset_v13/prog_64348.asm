; DESCRIPTION: Renders a purple box of size 78x118 starting at (339, 34).
; PLAN: r0=339(x), r1=34(y), r2=78(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 34
LDI r2, 78
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

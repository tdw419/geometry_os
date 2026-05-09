; DESCRIPTION: Renders a purple box of size 78x106 starting at (370, 88).
; PLAN: r0=370(x), r1=88(y), r2=78(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 88
LDI r2, 78
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

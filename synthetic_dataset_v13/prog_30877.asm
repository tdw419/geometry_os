; DESCRIPTION: Renders a blue box of size 117x102 starting at (216, 147).
; PLAN: r0=216(x), r1=147(y), r2=117(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 147
LDI r2, 117
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

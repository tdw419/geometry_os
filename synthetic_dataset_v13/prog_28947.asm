; DESCRIPTION: Renders a blue box of size 36x94 starting at (130, 114).
; PLAN: r0=130(x), r1=114(y), r2=36(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 114
LDI r2, 36
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

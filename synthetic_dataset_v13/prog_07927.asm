; DESCRIPTION: Renders a purple box of size 14x29 starting at (339, 71).
; PLAN: r0=339(x), r1=71(y), r2=14(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 71
LDI r2, 14
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 66x88 starting at (378, 70).
; PLAN: r0=378(x), r1=70(y), r2=66(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 70
LDI r2, 66
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

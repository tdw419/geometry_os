; DESCRIPTION: Renders a purple box of size 52x88 starting at (163, 100).
; PLAN: r0=163(x), r1=100(y), r2=52(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 100
LDI r2, 52
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 96x34 starting at (29, 88).
; PLAN: r0=29(x), r1=88(y), r2=96(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 88
LDI r2, 96
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

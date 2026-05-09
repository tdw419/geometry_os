; DESCRIPTION: Renders a blue box of size 81x34 starting at (56, 47).
; PLAN: r0=56(x), r1=47(y), r2=81(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 47
LDI r2, 81
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

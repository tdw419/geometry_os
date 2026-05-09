; DESCRIPTION: Renders a blue box of size 109x119 starting at (22, 61).
; PLAN: r0=22(x), r1=61(y), r2=109(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 61
LDI r2, 109
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

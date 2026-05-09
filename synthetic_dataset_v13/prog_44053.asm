; DESCRIPTION: Renders a blue box of size 109x15 starting at (88, 62).
; PLAN: r0=88(x), r1=62(y), r2=109(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 62
LDI r2, 109
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue box of size 100x88 starting at (18, 59).
; PLAN: r0=18(x), r1=59(y), r2=100(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 59
LDI r2, 100
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

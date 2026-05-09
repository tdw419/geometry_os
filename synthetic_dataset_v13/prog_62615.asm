; DESCRIPTION: Renders a blue box of size 88x76 starting at (151, 26).
; PLAN: r0=151(x), r1=26(y), r2=88(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 26
LDI r2, 88
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

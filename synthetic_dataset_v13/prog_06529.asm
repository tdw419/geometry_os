; DESCRIPTION: Renders a blue box of size 88x93 starting at (48, 158).
; PLAN: r0=48(x), r1=158(y), r2=88(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 158
LDI r2, 88
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

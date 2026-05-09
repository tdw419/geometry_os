; DESCRIPTION: Renders a blue box of size 14x73 starting at (318, 151).
; PLAN: r0=318(x), r1=151(y), r2=14(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 151
LDI r2, 14
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

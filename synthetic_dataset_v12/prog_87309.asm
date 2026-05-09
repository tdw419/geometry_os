; DESCRIPTION: Renders a blue box of size 62x21 starting at (40, 151).
; PLAN: r0=40(x), r1=151(y), r2=62(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 151
LDI r2, 62
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

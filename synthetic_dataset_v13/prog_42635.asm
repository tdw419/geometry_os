; DESCRIPTION: Renders a blue box of size 114x20 starting at (294, 151).
; PLAN: r0=294(x), r1=151(y), r2=114(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 151
LDI r2, 114
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

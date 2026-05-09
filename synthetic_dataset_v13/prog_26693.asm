; DESCRIPTION: Renders a blue box of size 45x100 starting at (246, 151).
; PLAN: r0=246(x), r1=151(y), r2=45(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 151
LDI r2, 45
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

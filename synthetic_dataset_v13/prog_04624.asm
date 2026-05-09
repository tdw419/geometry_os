; DESCRIPTION: Renders a purple box of size 64x94 starting at (58, 151).
; PLAN: r0=58(x), r1=151(y), r2=64(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 151
LDI r2, 64
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

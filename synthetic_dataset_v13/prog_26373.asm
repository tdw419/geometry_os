; DESCRIPTION: Renders a blue box of size 99x12 starting at (340, 151).
; PLAN: r0=340(x), r1=151(y), r2=99(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 151
LDI r2, 99
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

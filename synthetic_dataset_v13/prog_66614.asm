; DESCRIPTION: Renders a red box of size 87x40 starting at (129, 151).
; PLAN: r0=129(x), r1=151(y), r2=87(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 151
LDI r2, 87
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

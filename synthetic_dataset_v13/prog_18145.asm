; DESCRIPTION: Renders a red box of size 23x43 starting at (94, 151).
; PLAN: r0=94(x), r1=151(y), r2=23(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 151
LDI r2, 23
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

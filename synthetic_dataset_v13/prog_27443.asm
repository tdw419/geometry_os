; DESCRIPTION: Renders a green box of size 77x35 starting at (17, 151).
; PLAN: r0=17(x), r1=151(y), r2=77(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 151
LDI r2, 77
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

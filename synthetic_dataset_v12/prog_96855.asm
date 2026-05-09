; DESCRIPTION: Renders a black box of size 38x98 starting at (181, 151).
; PLAN: r0=181(x), r1=151(y), r2=38(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 151
LDI r2, 38
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

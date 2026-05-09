; DESCRIPTION: Renders a red box of size 36x82 starting at (472, 151).
; PLAN: r0=472(x), r1=151(y), r2=36(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 151
LDI r2, 36
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

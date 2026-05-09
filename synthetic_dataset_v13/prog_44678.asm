; DESCRIPTION: Renders a red box of size 33x39 starting at (83, 151).
; PLAN: r0=83(x), r1=151(y), r2=33(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 151
LDI r2, 33
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

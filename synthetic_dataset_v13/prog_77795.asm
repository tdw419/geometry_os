; DESCRIPTION: Renders a red box of size 101x43 starting at (343, 58).
; PLAN: r0=343(x), r1=58(y), r2=101(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 58
LDI r2, 101
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

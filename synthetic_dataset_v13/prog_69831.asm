; DESCRIPTION: Renders a red box of size 102x89 starting at (97, 53).
; PLAN: r0=97(x), r1=53(y), r2=102(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 53
LDI r2, 102
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

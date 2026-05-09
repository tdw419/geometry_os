; DESCRIPTION: Renders a red box of size 81x76 starting at (47, 105).
; PLAN: r0=47(x), r1=105(y), r2=81(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 105
LDI r2, 81
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 53x106 starting at (84, 116).
; PLAN: r0=84(x), r1=116(y), r2=53(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 116
LDI r2, 53
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

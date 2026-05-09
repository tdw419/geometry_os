; DESCRIPTION: Renders a red box of size 15x84 starting at (194, 53).
; PLAN: r0=194(x), r1=53(y), r2=15(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 53
LDI r2, 15
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

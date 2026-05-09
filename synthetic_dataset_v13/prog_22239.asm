; DESCRIPTION: Renders a red box of size 113x108 starting at (8, 116).
; PLAN: r0=8(x), r1=116(y), r2=113(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 116
LDI r2, 113
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

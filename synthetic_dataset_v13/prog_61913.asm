; DESCRIPTION: Renders a red box of size 34x100 starting at (165, 116).
; PLAN: r0=165(x), r1=116(y), r2=34(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 116
LDI r2, 34
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

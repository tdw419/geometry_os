; DESCRIPTION: Renders a red box of size 116x31 starting at (357, 155).
; PLAN: r0=357(x), r1=155(y), r2=116(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 155
LDI r2, 116
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

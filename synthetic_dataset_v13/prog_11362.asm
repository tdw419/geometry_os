; DESCRIPTION: Renders a red box of size 23x63 starting at (244, 116).
; PLAN: r0=244(x), r1=116(y), r2=23(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 116
LDI r2, 23
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

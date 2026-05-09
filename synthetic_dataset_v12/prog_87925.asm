; DESCRIPTION: Renders a red box of size 84x35 starting at (88, 34).
; PLAN: r0=88(x), r1=34(y), r2=84(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 34
LDI r2, 84
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

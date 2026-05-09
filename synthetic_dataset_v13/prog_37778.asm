; DESCRIPTION: Renders a red box of size 34x35 starting at (395, 36).
; PLAN: r0=395(x), r1=36(y), r2=34(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 36
LDI r2, 34
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 54x14 starting at (88, 34).
; PLAN: r0=88(x), r1=34(y), r2=54(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 34
LDI r2, 54
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

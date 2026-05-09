; DESCRIPTION: Renders a red box of size 68x18 starting at (414, 34).
; PLAN: r0=414(x), r1=34(y), r2=68(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 34
LDI r2, 68
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

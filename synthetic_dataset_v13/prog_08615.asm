; DESCRIPTION: Renders a red box of size 34x89 starting at (115, 141).
; PLAN: r0=115(x), r1=141(y), r2=34(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 141
LDI r2, 34
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

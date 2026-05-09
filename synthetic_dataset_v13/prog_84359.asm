; DESCRIPTION: Renders a red box of size 118x34 starting at (83, 118).
; PLAN: r0=83(x), r1=118(y), r2=118(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 118
LDI r2, 118
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

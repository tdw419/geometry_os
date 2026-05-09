; DESCRIPTION: Renders a red box of size 31x34 starting at (201, 95).
; PLAN: r0=201(x), r1=95(y), r2=31(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 95
LDI r2, 31
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

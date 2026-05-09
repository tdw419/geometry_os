; DESCRIPTION: Renders a red box of size 34x24 starting at (348, 179).
; PLAN: r0=348(x), r1=179(y), r2=34(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 179
LDI r2, 34
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

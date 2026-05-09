; DESCRIPTION: Renders a red box of size 74x68 starting at (419, 77).
; PLAN: r0=419(x), r1=77(y), r2=74(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 77
LDI r2, 74
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

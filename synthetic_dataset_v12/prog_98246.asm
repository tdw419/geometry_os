; DESCRIPTION: Renders a red box of size 81x34 starting at (407, 80).
; PLAN: r0=407(x), r1=80(y), r2=81(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 80
LDI r2, 81
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

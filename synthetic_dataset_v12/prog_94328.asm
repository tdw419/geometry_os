; DESCRIPTION: Renders a red box of size 77x115 starting at (194, 74).
; PLAN: r0=194(x), r1=74(y), r2=77(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 74
LDI r2, 77
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

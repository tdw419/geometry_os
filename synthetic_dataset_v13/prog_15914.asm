; DESCRIPTION: Renders a red box of size 77x119 starting at (231, 64).
; PLAN: r0=231(x), r1=64(y), r2=77(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 64
LDI r2, 77
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

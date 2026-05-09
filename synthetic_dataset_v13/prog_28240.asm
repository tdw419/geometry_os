; DESCRIPTION: Renders a red box of size 16x101 starting at (312, 31).
; PLAN: r0=312(x), r1=31(y), r2=16(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 31
LDI r2, 16
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

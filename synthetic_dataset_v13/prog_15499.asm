; DESCRIPTION: Renders a red box of size 100x31 starting at (9, 3).
; PLAN: r0=9(x), r1=3(y), r2=100(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 3
LDI r2, 100
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

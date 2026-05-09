; DESCRIPTION: Renders a red box of size 52x35 starting at (106, 45).
; PLAN: r0=106(x), r1=45(y), r2=52(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 45
LDI r2, 52
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

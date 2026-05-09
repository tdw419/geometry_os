; DESCRIPTION: Renders a red box of size 60x95 starting at (3, 123).
; PLAN: r0=3(x), r1=123(y), r2=60(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 123
LDI r2, 60
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

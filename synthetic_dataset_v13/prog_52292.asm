; DESCRIPTION: Renders a red box of size 26x34 starting at (193, 0).
; PLAN: r0=193(x), r1=0(y), r2=26(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 0
LDI r2, 26
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

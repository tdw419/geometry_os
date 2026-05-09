; DESCRIPTION: Renders a red box of size 35x106 starting at (28, 54).
; PLAN: r0=28(x), r1=54(y), r2=35(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 54
LDI r2, 35
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

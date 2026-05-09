; DESCRIPTION: Renders a red box of size 57x106 starting at (34, 101).
; PLAN: r0=34(x), r1=101(y), r2=57(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 101
LDI r2, 57
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 58x106 starting at (149, 4).
; PLAN: r0=149(x), r1=4(y), r2=58(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 4
LDI r2, 58
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

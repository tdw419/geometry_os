; DESCRIPTION: Renders a red box of size 101x62 starting at (163, 102).
; PLAN: r0=163(x), r1=102(y), r2=101(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 102
LDI r2, 101
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 89x114 starting at (206, 102).
; PLAN: r0=206(x), r1=102(y), r2=89(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 102
LDI r2, 89
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

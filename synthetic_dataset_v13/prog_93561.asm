; DESCRIPTION: Renders a red box of size 45x89 starting at (258, 58).
; PLAN: r0=258(x), r1=58(y), r2=45(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 58
LDI r2, 45
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

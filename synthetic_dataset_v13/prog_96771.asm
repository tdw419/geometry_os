; DESCRIPTION: Renders a red box of size 58x33 starting at (141, 88).
; PLAN: r0=141(x), r1=88(y), r2=58(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 88
LDI r2, 58
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

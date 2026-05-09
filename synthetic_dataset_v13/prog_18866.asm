; DESCRIPTION: Renders a red box of size 92x31 starting at (118, 88).
; PLAN: r0=118(x), r1=88(y), r2=92(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 88
LDI r2, 92
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

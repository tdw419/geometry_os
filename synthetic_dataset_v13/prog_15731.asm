; DESCRIPTION: Renders a red box of size 57x102 starting at (282, 88).
; PLAN: r0=282(x), r1=88(y), r2=57(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 88
LDI r2, 57
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

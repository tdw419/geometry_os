; DESCRIPTION: Renders a red box of size 105x88 starting at (72, 137).
; PLAN: r0=72(x), r1=137(y), r2=105(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 137
LDI r2, 105
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

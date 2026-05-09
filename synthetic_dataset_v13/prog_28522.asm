; DESCRIPTION: Renders a red box of size 64x110 starting at (89, 88).
; PLAN: r0=89(x), r1=88(y), r2=64(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 88
LDI r2, 64
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

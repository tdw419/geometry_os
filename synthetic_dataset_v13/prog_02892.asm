; DESCRIPTION: Renders a red box of size 88x10 starting at (20, 104).
; PLAN: r0=20(x), r1=104(y), r2=88(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 104
LDI r2, 88
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

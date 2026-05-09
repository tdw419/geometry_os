; DESCRIPTION: Renders a red box of size 20x30 starting at (182, 22).
; PLAN: r0=182(x), r1=22(y), r2=20(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 22
LDI r2, 20
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

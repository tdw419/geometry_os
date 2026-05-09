; DESCRIPTION: Renders a red box of size 52x62 starting at (316, 49).
; PLAN: r0=316(x), r1=49(y), r2=52(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 49
LDI r2, 52
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

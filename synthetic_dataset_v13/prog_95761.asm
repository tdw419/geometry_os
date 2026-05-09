; DESCRIPTION: Renders a red box of size 52x94 starting at (85, 137).
; PLAN: r0=85(x), r1=137(y), r2=52(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 137
LDI r2, 52
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 52x49 starting at (55, 115).
; PLAN: r0=55(x), r1=115(y), r2=52(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 115
LDI r2, 52
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 87x52 starting at (27, 58).
; PLAN: r0=27(x), r1=58(y), r2=87(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 58
LDI r2, 87
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 15x52 starting at (36, 118).
; PLAN: r0=36(x), r1=118(y), r2=15(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 118
LDI r2, 15
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

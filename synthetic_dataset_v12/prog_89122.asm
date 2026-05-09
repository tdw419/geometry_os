; DESCRIPTION: Renders a red box of size 14x34 starting at (36, 114).
; PLAN: r0=36(x), r1=114(y), r2=14(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 114
LDI r2, 14
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 74x109 starting at (252, 56).
; PLAN: r0=252(x), r1=56(y), r2=74(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 56
LDI r2, 74
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

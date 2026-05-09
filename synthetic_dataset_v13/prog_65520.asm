; DESCRIPTION: Renders a red box of size 30x36 starting at (112, 106).
; PLAN: r0=112(x), r1=106(y), r2=30(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 106
LDI r2, 30
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

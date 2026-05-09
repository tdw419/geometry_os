; DESCRIPTION: Renders a red box of size 26x36 starting at (233, 6).
; PLAN: r0=233(x), r1=6(y), r2=26(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 6
LDI r2, 26
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

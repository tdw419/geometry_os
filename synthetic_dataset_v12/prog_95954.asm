; DESCRIPTION: Renders a red box of size 36x97 starting at (452, 1).
; PLAN: r0=452(x), r1=1(y), r2=36(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 1
LDI r2, 36
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

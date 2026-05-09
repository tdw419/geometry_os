; DESCRIPTION: Renders a red box of size 74x114 starting at (261, 33).
; PLAN: r0=261(x), r1=33(y), r2=74(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 33
LDI r2, 74
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 114x89 starting at (37, 165).
; PLAN: r0=37(x), r1=165(y), r2=114(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 165
LDI r2, 114
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

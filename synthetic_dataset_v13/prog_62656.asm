; DESCRIPTION: Renders a white box of size 49x89 starting at (158, 76).
; PLAN: r0=158(x), r1=76(y), r2=49(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 76
LDI r2, 49
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

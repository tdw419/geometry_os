; DESCRIPTION: Renders a white box of size 117x89 starting at (322, 118).
; PLAN: r0=322(x), r1=118(y), r2=117(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 118
LDI r2, 117
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

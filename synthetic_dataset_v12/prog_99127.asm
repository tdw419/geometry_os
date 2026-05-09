; DESCRIPTION: Renders a white box of size 51x89 starting at (314, 77).
; PLAN: r0=314(x), r1=77(y), r2=51(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 77
LDI r2, 51
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

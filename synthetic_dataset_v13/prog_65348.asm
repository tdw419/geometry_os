; DESCRIPTION: Renders a white box of size 25x89 starting at (484, 120).
; PLAN: r0=484(x), r1=120(y), r2=25(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 120
LDI r2, 25
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

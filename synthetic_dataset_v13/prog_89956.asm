; DESCRIPTION: Renders a white box of size 19x89 starting at (231, 110).
; PLAN: r0=231(x), r1=110(y), r2=19(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 110
LDI r2, 19
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

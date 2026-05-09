; DESCRIPTION: Renders a white box of size 118x85 starting at (78, 110).
; PLAN: r0=78(x), r1=110(y), r2=118(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 110
LDI r2, 118
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 81x70 starting at (417, 41).
; PLAN: r0=417(x), r1=41(y), r2=81(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 41
LDI r2, 81
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

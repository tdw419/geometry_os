; DESCRIPTION: Renders a white box of size 60x34 starting at (41, 115).
; PLAN: r0=41(x), r1=115(y), r2=60(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 115
LDI r2, 60
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

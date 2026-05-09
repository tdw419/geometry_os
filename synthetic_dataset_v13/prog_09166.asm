; DESCRIPTION: Renders a white box of size 118x107 starting at (31, 43).
; PLAN: r0=31(x), r1=43(y), r2=118(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 43
LDI r2, 118
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 35x107 starting at (97, 122).
; PLAN: r0=97(x), r1=122(y), r2=35(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 122
LDI r2, 35
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

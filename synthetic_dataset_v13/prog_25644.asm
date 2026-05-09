; DESCRIPTION: Renders a white box of size 107x52 starting at (114, 118).
; PLAN: r0=114(x), r1=118(y), r2=107(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 118
LDI r2, 107
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

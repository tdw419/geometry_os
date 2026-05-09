; DESCRIPTION: Renders a white box of size 118x37 starting at (375, 114).
; PLAN: r0=375(x), r1=114(y), r2=118(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 114
LDI r2, 118
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

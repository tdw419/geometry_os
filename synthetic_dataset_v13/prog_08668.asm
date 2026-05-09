; DESCRIPTION: Renders a white box of size 51x41 starting at (216, 211).
; PLAN: r0=216(x), r1=211(y), r2=51(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 211
LDI r2, 51
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

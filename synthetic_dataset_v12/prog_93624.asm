; DESCRIPTION: Renders a white box of size 70x51 starting at (109, 130).
; PLAN: r0=109(x), r1=130(y), r2=70(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 130
LDI r2, 70
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

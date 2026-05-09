; DESCRIPTION: Renders a white box of size 51x84 starting at (142, 130).
; PLAN: r0=142(x), r1=130(y), r2=51(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 130
LDI r2, 51
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

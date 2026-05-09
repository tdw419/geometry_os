; DESCRIPTION: Renders a white box of size 118x51 starting at (389, 44).
; PLAN: r0=389(x), r1=44(y), r2=118(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 44
LDI r2, 118
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

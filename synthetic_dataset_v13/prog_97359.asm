; DESCRIPTION: Renders a white box of size 102x90 starting at (390, 51).
; PLAN: r0=390(x), r1=51(y), r2=102(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 51
LDI r2, 102
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

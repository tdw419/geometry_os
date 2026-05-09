; DESCRIPTION: Renders a white box of size 80x105 starting at (51, 47).
; PLAN: r0=51(x), r1=47(y), r2=80(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 47
LDI r2, 80
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

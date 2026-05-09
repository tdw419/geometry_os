; DESCRIPTION: Renders a white box of size 51x79 starting at (310, 30).
; PLAN: r0=310(x), r1=30(y), r2=51(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 30
LDI r2, 51
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 105x100 starting at (266, 66).
; PLAN: r0=266(x), r1=66(y), r2=105(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 66
LDI r2, 105
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

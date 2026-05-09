; DESCRIPTION: Renders a white box of size 51x95 starting at (97, 24).
; PLAN: r0=97(x), r1=24(y), r2=51(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 24
LDI r2, 51
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

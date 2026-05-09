; DESCRIPTION: Renders a white box of size 119x97 starting at (174, 112).
; PLAN: r0=174(x), r1=112(y), r2=119(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 112
LDI r2, 119
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

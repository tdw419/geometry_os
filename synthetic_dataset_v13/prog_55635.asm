; DESCRIPTION: Renders a white box of size 31x19 starting at (3, 156).
; PLAN: r0=3(x), r1=156(y), r2=31(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 156
LDI r2, 31
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

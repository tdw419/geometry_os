; DESCRIPTION: Renders a white box of size 66x112 starting at (372, 119).
; PLAN: r0=372(x), r1=119(y), r2=66(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 119
LDI r2, 66
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

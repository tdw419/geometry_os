; DESCRIPTION: Renders a white box of size 114x81 starting at (201, 78).
; PLAN: r0=201(x), r1=78(y), r2=114(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 78
LDI r2, 114
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

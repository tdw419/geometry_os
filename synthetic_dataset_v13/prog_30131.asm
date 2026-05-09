; DESCRIPTION: Renders a white box of size 81x78 starting at (258, 22).
; PLAN: r0=258(x), r1=22(y), r2=81(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 22
LDI r2, 81
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

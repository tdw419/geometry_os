; DESCRIPTION: Renders a green box of size 29x114 starting at (351, 124).
; PLAN: r0=351(x), r1=124(y), r2=29(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 124
LDI r2, 29
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

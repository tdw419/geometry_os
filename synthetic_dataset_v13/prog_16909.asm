; DESCRIPTION: Renders a white box of size 83x114 starting at (84, 124).
; PLAN: r0=84(x), r1=124(y), r2=83(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 124
LDI r2, 83
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

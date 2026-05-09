; DESCRIPTION: Renders a blue box of size 77x83 starting at (83, 119).
; PLAN: r0=83(x), r1=119(y), r2=77(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 119
LDI r2, 77
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

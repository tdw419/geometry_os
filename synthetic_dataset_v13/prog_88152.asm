; DESCRIPTION: Renders a white box of size 105x36 starting at (402, 119).
; PLAN: r0=402(x), r1=119(y), r2=105(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 119
LDI r2, 105
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

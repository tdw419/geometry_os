; DESCRIPTION: Renders a white box of size 81x63 starting at (192, 145).
; PLAN: r0=192(x), r1=145(y), r2=81(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 145
LDI r2, 81
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

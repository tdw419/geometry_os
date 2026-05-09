; DESCRIPTION: Renders a white box of size 15x37 starting at (448, 212).
; PLAN: r0=448(x), r1=212(y), r2=15(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 212
LDI r2, 15
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

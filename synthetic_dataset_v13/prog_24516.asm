; DESCRIPTION: Places a blue 20x85 rectangle at position (15, 112).
; PLAN: r0=15(x), r1=112(y), r2=20(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 112
LDI r2, 20
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

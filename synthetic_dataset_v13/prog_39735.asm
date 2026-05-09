; DESCRIPTION: Places a blue 89x52 rectangle at position (153, 145).
; PLAN: r0=153(x), r1=145(y), r2=89(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 145
LDI r2, 89
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 37x89 rectangle at position (451, 73).
; PLAN: r0=451(x), r1=73(y), r2=37(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 73
LDI r2, 37
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

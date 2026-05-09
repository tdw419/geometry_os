; DESCRIPTION: Places a blue 36x112 rectangle at position (451, 78).
; PLAN: r0=451(x), r1=78(y), r2=36(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 78
LDI r2, 36
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

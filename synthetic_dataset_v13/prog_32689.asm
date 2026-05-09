; DESCRIPTION: Places a magenta 11x44 rectangle at position (451, 136).
; PLAN: r0=451(x), r1=136(y), r2=11(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 136
LDI r2, 11
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 57x99 rectangle at position (451, 7).
; PLAN: r0=451(x), r1=7(y), r2=57(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 7
LDI r2, 57
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

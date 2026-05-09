; DESCRIPTION: Places a magenta 44x117 rectangle at position (451, 13).
; PLAN: r0=451(x), r1=13(y), r2=44(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 13
LDI r2, 44
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

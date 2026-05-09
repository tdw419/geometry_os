; DESCRIPTION: Places a magenta 11x97 rectangle at position (97, 110).
; PLAN: r0=97(x), r1=110(y), r2=11(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 110
LDI r2, 11
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

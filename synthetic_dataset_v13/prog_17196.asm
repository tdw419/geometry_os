; DESCRIPTION: Places a blue 97x89 rectangle at position (195, 56).
; PLAN: r0=195(x), r1=56(y), r2=97(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 56
LDI r2, 97
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

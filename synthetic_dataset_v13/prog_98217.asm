; DESCRIPTION: Places a magenta 97x13 rectangle at position (201, 157).
; PLAN: r0=201(x), r1=157(y), r2=97(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 157
LDI r2, 97
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

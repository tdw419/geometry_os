; DESCRIPTION: Places a magenta 97x85 rectangle at position (118, 63).
; PLAN: r0=118(x), r1=63(y), r2=97(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 63
LDI r2, 97
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

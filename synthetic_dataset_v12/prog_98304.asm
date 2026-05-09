; DESCRIPTION: Places a magenta 19x110 rectangle at position (30, 63).
; PLAN: r0=30(x), r1=63(y), r2=19(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 63
LDI r2, 19
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

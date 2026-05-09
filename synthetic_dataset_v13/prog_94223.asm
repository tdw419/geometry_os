; DESCRIPTION: Places a purple 98x85 rectangle at position (84, 63).
; PLAN: r0=84(x), r1=63(y), r2=98(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 63
LDI r2, 98
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

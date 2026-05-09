; DESCRIPTION: Places a purple 11x25 rectangle at position (98, 63).
; PLAN: r0=98(x), r1=63(y), r2=11(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 63
LDI r2, 11
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

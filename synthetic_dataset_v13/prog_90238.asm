; DESCRIPTION: Places a purple 23x75 rectangle at position (471, 75).
; PLAN: r0=471(x), r1=75(y), r2=23(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 75
LDI r2, 23
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

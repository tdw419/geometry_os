; DESCRIPTION: Places a purple 94x79 rectangle at position (83, 73).
; PLAN: r0=83(x), r1=73(y), r2=94(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 73
LDI r2, 94
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 60x73 rectangle at position (64, 110).
; PLAN: r0=64(x), r1=110(y), r2=60(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 110
LDI r2, 60
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

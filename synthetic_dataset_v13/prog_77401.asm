; DESCRIPTION: Places a purple 110x81 rectangle at position (195, 18).
; PLAN: r0=195(x), r1=18(y), r2=110(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 18
LDI r2, 110
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

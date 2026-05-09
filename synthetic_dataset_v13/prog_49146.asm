; DESCRIPTION: Places a purple 37x79 rectangle at position (200, 176).
; PLAN: r0=200(x), r1=176(y), r2=37(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 176
LDI r2, 37
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

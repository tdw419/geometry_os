; DESCRIPTION: Places a purple 79x80 rectangle at position (367, 105).
; PLAN: r0=367(x), r1=105(y), r2=79(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 105
LDI r2, 79
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 45x79 rectangle at position (456, 85).
; PLAN: r0=456(x), r1=85(y), r2=45(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 85
LDI r2, 45
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

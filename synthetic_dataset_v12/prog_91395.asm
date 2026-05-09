; DESCRIPTION: Places a purple 95x26 rectangle at position (390, 79).
; PLAN: r0=390(x), r1=79(y), r2=95(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 79
LDI r2, 95
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

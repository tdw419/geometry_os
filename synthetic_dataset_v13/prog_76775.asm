; DESCRIPTION: Places a purple 110x13 rectangle at position (231, 120).
; PLAN: r0=231(x), r1=120(y), r2=110(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 120
LDI r2, 110
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

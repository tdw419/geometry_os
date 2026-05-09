; DESCRIPTION: Places a purple 118x47 rectangle at position (97, 35).
; PLAN: r0=97(x), r1=35(y), r2=118(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 35
LDI r2, 118
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

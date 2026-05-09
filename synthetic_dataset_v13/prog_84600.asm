; DESCRIPTION: Places a purple 57x78 rectangle at position (433, 157).
; PLAN: r0=433(x), r1=157(y), r2=57(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 157
LDI r2, 57
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

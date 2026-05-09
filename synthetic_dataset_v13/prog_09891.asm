; DESCRIPTION: Places a purple 119x89 rectangle at position (94, 90).
; PLAN: r0=94(x), r1=90(y), r2=119(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 90
LDI r2, 119
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

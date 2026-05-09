; DESCRIPTION: Places a purple 89x14 rectangle at position (80, 185).
; PLAN: r0=80(x), r1=185(y), r2=89(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 185
LDI r2, 89
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

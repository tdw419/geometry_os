; DESCRIPTION: Places a purple 90x89 rectangle at position (308, 73).
; PLAN: r0=308(x), r1=73(y), r2=90(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 73
LDI r2, 90
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

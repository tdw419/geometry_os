; DESCRIPTION: Places a purple 45x12 rectangle at position (351, 45).
; PLAN: r0=351(x), r1=45(y), r2=45(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 45
LDI r2, 45
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

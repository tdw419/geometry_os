; DESCRIPTION: Places a purple 64x65 rectangle at position (351, 159).
; PLAN: r0=351(x), r1=159(y), r2=64(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 159
LDI r2, 64
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

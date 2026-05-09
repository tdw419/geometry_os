; DESCRIPTION: Places a purple 85x112 rectangle at position (351, 86).
; PLAN: r0=351(x), r1=86(y), r2=85(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 86
LDI r2, 85
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 60x31 rectangle at position (441, 104).
; PLAN: r0=441(x), r1=104(y), r2=60(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 104
LDI r2, 60
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

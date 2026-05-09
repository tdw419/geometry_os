; DESCRIPTION: Places a purple 30x85 rectangle at position (431, 140).
; PLAN: r0=431(x), r1=140(y), r2=30(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 140
LDI r2, 30
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

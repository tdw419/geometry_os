; DESCRIPTION: Places a purple 100x58 rectangle at position (324, 87).
; PLAN: r0=324(x), r1=87(y), r2=100(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 87
LDI r2, 100
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 63x100 rectangle at position (83, 62).
; PLAN: r0=83(x), r1=62(y), r2=63(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 62
LDI r2, 63
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

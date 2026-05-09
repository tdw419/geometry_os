; DESCRIPTION: Places a purple 64x85 rectangle at position (128, 76).
; PLAN: r0=128(x), r1=76(y), r2=64(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 76
LDI r2, 64
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

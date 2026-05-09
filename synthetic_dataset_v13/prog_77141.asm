; DESCRIPTION: Places a purple 21x13 rectangle at position (402, 81).
; PLAN: r0=402(x), r1=81(y), r2=21(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 81
LDI r2, 21
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

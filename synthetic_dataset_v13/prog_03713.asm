; DESCRIPTION: Places a purple 37x62 rectangle at position (418, 32).
; PLAN: r0=418(x), r1=32(y), r2=37(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 32
LDI r2, 37
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

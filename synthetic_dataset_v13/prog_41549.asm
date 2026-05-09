; DESCRIPTION: Places a purple 49x31 rectangle at position (379, 62).
; PLAN: r0=379(x), r1=62(y), r2=49(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 62
LDI r2, 49
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

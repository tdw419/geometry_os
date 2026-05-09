; DESCRIPTION: Places a purple 56x26 rectangle at position (379, 67).
; PLAN: r0=379(x), r1=67(y), r2=56(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 67
LDI r2, 56
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

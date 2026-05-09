; DESCRIPTION: Places a purple 117x43 rectangle at position (379, 126).
; PLAN: r0=379(x), r1=126(y), r2=117(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 126
LDI r2, 117
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

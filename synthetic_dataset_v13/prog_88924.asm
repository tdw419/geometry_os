; DESCRIPTION: Places a purple 78x69 rectangle at position (418, 53).
; PLAN: r0=418(x), r1=53(y), r2=78(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 53
LDI r2, 78
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

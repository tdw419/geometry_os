; DESCRIPTION: Places a purple 37x45 rectangle at position (437, 53).
; PLAN: r0=437(x), r1=53(y), r2=37(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 53
LDI r2, 37
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

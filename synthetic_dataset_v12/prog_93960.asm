; DESCRIPTION: Places a purple 117x73 rectangle at position (119, 45).
; PLAN: r0=119(x), r1=45(y), r2=117(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 45
LDI r2, 117
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

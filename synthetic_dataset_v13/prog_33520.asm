; DESCRIPTION: Places a purple 23x73 rectangle at position (389, 60).
; PLAN: r0=389(x), r1=60(y), r2=23(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 60
LDI r2, 23
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

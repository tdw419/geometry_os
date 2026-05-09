; DESCRIPTION: Places a purple 118x67 rectangle at position (389, 121).
; PLAN: r0=389(x), r1=121(y), r2=118(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 121
LDI r2, 118
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

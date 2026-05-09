; DESCRIPTION: Places a purple 100x40 rectangle at position (311, 133).
; PLAN: r0=311(x), r1=133(y), r2=100(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 133
LDI r2, 100
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 100x103 rectangle at position (388, 74).
; PLAN: r0=388(x), r1=74(y), r2=100(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 74
LDI r2, 100
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

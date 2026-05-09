; DESCRIPTION: Places a purple 101x88 rectangle at position (389, 49).
; PLAN: r0=389(x), r1=49(y), r2=101(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 49
LDI r2, 101
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

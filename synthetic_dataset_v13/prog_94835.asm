; DESCRIPTION: Places a purple 119x100 rectangle at position (142, 61).
; PLAN: r0=142(x), r1=61(y), r2=119(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 61
LDI r2, 119
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

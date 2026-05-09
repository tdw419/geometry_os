; DESCRIPTION: Places a purple 119x118 rectangle at position (331, 62).
; PLAN: r0=331(x), r1=62(y), r2=119(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 62
LDI r2, 119
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

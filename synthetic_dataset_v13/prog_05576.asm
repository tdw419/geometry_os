; DESCRIPTION: Places a purple 33x118 rectangle at position (435, 66).
; PLAN: r0=435(x), r1=66(y), r2=33(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 66
LDI r2, 33
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

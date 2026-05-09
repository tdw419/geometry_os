; DESCRIPTION: Places a purple 118x34 rectangle at position (117, 219).
; PLAN: r0=117(x), r1=219(y), r2=118(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 219
LDI r2, 118
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 118x94 rectangle at position (129, 84).
; PLAN: r0=129(x), r1=84(y), r2=118(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 84
LDI r2, 118
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

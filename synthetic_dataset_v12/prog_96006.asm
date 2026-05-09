; DESCRIPTION: Places a purple 118x94 rectangle at position (121, 75).
; PLAN: r0=121(x), r1=75(y), r2=118(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 75
LDI r2, 118
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

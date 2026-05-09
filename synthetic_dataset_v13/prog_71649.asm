; DESCRIPTION: Places a purple 72x35 rectangle at position (158, 118).
; PLAN: r0=158(x), r1=118(y), r2=72(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 118
LDI r2, 72
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

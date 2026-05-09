; DESCRIPTION: Places a purple 118x104 rectangle at position (38, 127).
; PLAN: r0=38(x), r1=127(y), r2=118(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 127
LDI r2, 118
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

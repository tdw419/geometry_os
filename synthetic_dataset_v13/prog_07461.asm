; DESCRIPTION: Places a purple 70x22 rectangle at position (226, 94).
; PLAN: r0=226(x), r1=94(y), r2=70(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 94
LDI r2, 70
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

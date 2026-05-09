; DESCRIPTION: Places a purple 29x54 rectangle at position (133, 94).
; PLAN: r0=133(x), r1=94(y), r2=29(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 94
LDI r2, 29
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

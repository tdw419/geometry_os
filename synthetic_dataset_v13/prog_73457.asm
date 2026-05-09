; DESCRIPTION: Places a purple 80x115 rectangle at position (389, 46).
; PLAN: r0=389(x), r1=46(y), r2=80(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 46
LDI r2, 80
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

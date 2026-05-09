; DESCRIPTION: Places a purple 57x115 rectangle at position (345, 99).
; PLAN: r0=345(x), r1=99(y), r2=57(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 99
LDI r2, 57
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

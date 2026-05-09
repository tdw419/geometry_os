; DESCRIPTION: Places a purple 115x73 rectangle at position (186, 80).
; PLAN: r0=186(x), r1=80(y), r2=115(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 80
LDI r2, 115
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

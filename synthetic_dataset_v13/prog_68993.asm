; DESCRIPTION: Places a purple 52x94 rectangle at position (222, 53).
; PLAN: r0=222(x), r1=53(y), r2=52(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 53
LDI r2, 52
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

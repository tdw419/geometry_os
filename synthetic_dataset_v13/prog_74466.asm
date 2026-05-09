; DESCRIPTION: Places a purple 61x83 rectangle at position (131, 155).
; PLAN: r0=131(x), r1=155(y), r2=61(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 155
LDI r2, 61
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

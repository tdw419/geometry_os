; DESCRIPTION: Places a purple 37x36 rectangle at position (334, 61).
; PLAN: r0=334(x), r1=61(y), r2=37(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 61
LDI r2, 37
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

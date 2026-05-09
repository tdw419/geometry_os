; DESCRIPTION: Places a purple 88x83 rectangle at position (0, 61).
; PLAN: r0=0(x), r1=61(y), r2=88(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 61
LDI r2, 88
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

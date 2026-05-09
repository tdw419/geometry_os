; DESCRIPTION: Places a purple 36x13 rectangle at position (459, 31).
; PLAN: r0=459(x), r1=31(y), r2=36(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 31
LDI r2, 36
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 100x97 rectangle at position (22, 36).
; PLAN: r0=22(x), r1=36(y), r2=100(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 36
LDI r2, 100
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 61x69 rectangle at position (366, 99).
; PLAN: r0=366(x), r1=99(y), r2=61(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 99
LDI r2, 61
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

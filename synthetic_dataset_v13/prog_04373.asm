; DESCRIPTION: Places a purple 53x70 rectangle at position (51, 99).
; PLAN: r0=51(x), r1=99(y), r2=53(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 99
LDI r2, 53
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

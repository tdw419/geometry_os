; DESCRIPTION: Places a purple 51x75 rectangle at position (131, 31).
; PLAN: r0=131(x), r1=31(y), r2=51(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 31
LDI r2, 51
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 31x51 rectangle at position (178, 164).
; PLAN: r0=178(x), r1=164(y), r2=31(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 164
LDI r2, 31
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

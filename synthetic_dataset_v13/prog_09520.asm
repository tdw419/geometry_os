; DESCRIPTION: Places a purple 51x83 rectangle at position (261, 80).
; PLAN: r0=261(x), r1=80(y), r2=51(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 80
LDI r2, 51
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

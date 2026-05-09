; DESCRIPTION: Places a purple 119x115 rectangle at position (347, 25).
; PLAN: r0=347(x), r1=25(y), r2=119(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 25
LDI r2, 119
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

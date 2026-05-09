; DESCRIPTION: Places a purple 19x107 rectangle at position (350, 119).
; PLAN: r0=350(x), r1=119(y), r2=19(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 119
LDI r2, 19
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

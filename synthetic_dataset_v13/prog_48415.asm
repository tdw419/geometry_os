; DESCRIPTION: Places a purple 105x26 rectangle at position (19, 96).
; PLAN: r0=19(x), r1=96(y), r2=105(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 96
LDI r2, 105
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

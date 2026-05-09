; DESCRIPTION: Places a purple 85x35 rectangle at position (39, 105).
; PLAN: r0=39(x), r1=105(y), r2=85(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 105
LDI r2, 85
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

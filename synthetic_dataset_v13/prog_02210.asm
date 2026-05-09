; DESCRIPTION: Places a purple 76x96 rectangle at position (74, 110).
; PLAN: r0=74(x), r1=110(y), r2=76(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 110
LDI r2, 76
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

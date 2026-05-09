; DESCRIPTION: Places a purple 47x110 rectangle at position (325, 101).
; PLAN: r0=325(x), r1=101(y), r2=47(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 101
LDI r2, 47
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

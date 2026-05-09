; DESCRIPTION: Places a purple 93x110 rectangle at position (371, 6).
; PLAN: r0=371(x), r1=6(y), r2=93(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 6
LDI r2, 93
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

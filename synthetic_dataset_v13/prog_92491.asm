; DESCRIPTION: Places a purple 49x110 rectangle at position (103, 65).
; PLAN: r0=103(x), r1=65(y), r2=49(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 65
LDI r2, 49
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

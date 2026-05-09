; DESCRIPTION: Places a purple 110x25 rectangle at position (216, 40).
; PLAN: r0=216(x), r1=40(y), r2=110(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 40
LDI r2, 110
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

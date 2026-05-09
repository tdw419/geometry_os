; DESCRIPTION: Places a purple 110x98 rectangle at position (291, 15).
; PLAN: r0=291(x), r1=15(y), r2=110(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 15
LDI r2, 110
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

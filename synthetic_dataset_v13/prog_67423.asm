; DESCRIPTION: Places a purple 110x19 rectangle at position (135, 98).
; PLAN: r0=135(x), r1=98(y), r2=110(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 98
LDI r2, 110
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

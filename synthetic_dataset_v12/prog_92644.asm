; DESCRIPTION: Places a purple 35x62 rectangle at position (219, 34).
; PLAN: r0=219(x), r1=34(y), r2=35(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 34
LDI r2, 35
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

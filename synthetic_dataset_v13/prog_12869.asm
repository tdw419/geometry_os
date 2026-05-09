; DESCRIPTION: Places a purple 38x17 rectangle at position (451, 121).
; PLAN: r0=451(x), r1=121(y), r2=38(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 121
LDI r2, 38
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

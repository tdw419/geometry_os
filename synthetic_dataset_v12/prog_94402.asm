; DESCRIPTION: Places a purple 49x54 rectangle at position (366, 98).
; PLAN: r0=366(x), r1=98(y), r2=49(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 98
LDI r2, 49
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

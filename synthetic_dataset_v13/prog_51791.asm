; DESCRIPTION: Places a purple 49x54 rectangle at position (11, 121).
; PLAN: r0=11(x), r1=121(y), r2=49(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 121
LDI r2, 49
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

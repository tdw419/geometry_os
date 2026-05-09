; DESCRIPTION: Places a purple 49x114 rectangle at position (463, 96).
; PLAN: r0=463(x), r1=96(y), r2=49(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 96
LDI r2, 49
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 49x19 rectangle at position (331, 18).
; PLAN: r0=331(x), r1=18(y), r2=49(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 18
LDI r2, 49
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

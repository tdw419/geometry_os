; DESCRIPTION: Places a purple 49x26 rectangle at position (310, 205).
; PLAN: r0=310(x), r1=205(y), r2=49(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 205
LDI r2, 49
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 49x14 rectangle at position (319, 233).
; PLAN: r0=319(x), r1=233(y), r2=49(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 233
LDI r2, 49
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

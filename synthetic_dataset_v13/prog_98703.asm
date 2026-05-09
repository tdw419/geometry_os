; DESCRIPTION: Places a purple 64x34 rectangle at position (390, 170).
; PLAN: r0=390(x), r1=170(y), r2=64(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 170
LDI r2, 64
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

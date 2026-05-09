; DESCRIPTION: Places a purple 13x73 rectangle at position (8, 97).
; PLAN: r0=8(x), r1=97(y), r2=13(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 97
LDI r2, 13
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

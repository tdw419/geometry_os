; DESCRIPTION: Places a purple 78x83 rectangle at position (97, 19).
; PLAN: r0=97(x), r1=19(y), r2=78(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 19
LDI r2, 78
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

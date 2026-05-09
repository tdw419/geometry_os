; DESCRIPTION: Places a purple 31x62 rectangle at position (407, 13).
; PLAN: r0=407(x), r1=13(y), r2=31(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 13
LDI r2, 31
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

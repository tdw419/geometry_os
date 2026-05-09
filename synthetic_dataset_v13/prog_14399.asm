; DESCRIPTION: Places a purple 118x97 rectangle at position (249, 52).
; PLAN: r0=249(x), r1=52(y), r2=118(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 52
LDI r2, 118
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 68x118 rectangle at position (438, 94).
; PLAN: r0=438(x), r1=94(y), r2=68(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 94
LDI r2, 68
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

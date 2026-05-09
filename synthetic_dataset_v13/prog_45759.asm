; DESCRIPTION: Places a purple 29x94 rectangle at position (89, 140).
; PLAN: r0=89(x), r1=140(y), r2=29(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 140
LDI r2, 29
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

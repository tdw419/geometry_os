; DESCRIPTION: Places a blue 31x94 rectangle at position (149, 123).
; PLAN: r0=149(x), r1=123(y), r2=31(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 123
LDI r2, 31
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 73x94 rectangle at position (31, 100).
; PLAN: r0=31(x), r1=100(y), r2=73(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 100
LDI r2, 73
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

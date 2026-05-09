; DESCRIPTION: Places a blue 94x29 rectangle at position (94, 201).
; PLAN: r0=94(x), r1=201(y), r2=94(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 201
LDI r2, 94
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

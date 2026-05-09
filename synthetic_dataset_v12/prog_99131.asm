; DESCRIPTION: Places a blue 54x57 rectangle at position (201, 184).
; PLAN: r0=201(x), r1=184(y), r2=54(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 184
LDI r2, 54
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

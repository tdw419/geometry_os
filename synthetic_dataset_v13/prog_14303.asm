; DESCRIPTION: Places a blue 23x110 rectangle at position (413, 61).
; PLAN: r0=413(x), r1=61(y), r2=23(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 61
LDI r2, 23
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

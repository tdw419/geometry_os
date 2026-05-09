; DESCRIPTION: Places a blue 97x110 rectangle at position (248, 64).
; PLAN: r0=248(x), r1=64(y), r2=97(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 64
LDI r2, 97
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 91x31 rectangle at position (390, 3).
; PLAN: r0=390(x), r1=3(y), r2=91(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 3
LDI r2, 91
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

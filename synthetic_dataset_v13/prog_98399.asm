; DESCRIPTION: Places a blue 77x110 rectangle at position (208, 13).
; PLAN: r0=208(x), r1=13(y), r2=77(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 13
LDI r2, 77
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

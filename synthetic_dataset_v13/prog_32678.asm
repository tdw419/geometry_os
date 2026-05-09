; DESCRIPTION: Places a blue 77x87 rectangle at position (250, 26).
; PLAN: r0=250(x), r1=26(y), r2=77(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 26
LDI r2, 77
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

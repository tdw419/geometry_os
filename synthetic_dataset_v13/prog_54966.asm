; DESCRIPTION: Places a blue 35x110 rectangle at position (289, 99).
; PLAN: r0=289(x), r1=99(y), r2=35(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 99
LDI r2, 35
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black 66x110 rectangle at position (250, 11).
; PLAN: r0=250(x), r1=11(y), r2=66(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 11
LDI r2, 66
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

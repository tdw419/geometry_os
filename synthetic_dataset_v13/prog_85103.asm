; DESCRIPTION: Places a green 11x110 rectangle at position (44, 32).
; PLAN: r0=44(x), r1=32(y), r2=11(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 32
LDI r2, 11
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

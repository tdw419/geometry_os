; DESCRIPTION: Places a blue 105x87 rectangle at position (406, 89).
; PLAN: r0=406(x), r1=89(y), r2=105(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 89
LDI r2, 105
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

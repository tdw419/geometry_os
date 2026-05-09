; DESCRIPTION: Places a cyan 29x110 rectangle at position (89, 97).
; PLAN: r0=89(x), r1=97(y), r2=29(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 97
LDI r2, 29
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

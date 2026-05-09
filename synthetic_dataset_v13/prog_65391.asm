; DESCRIPTION: Places a green 105x35 rectangle at position (311, 97).
; PLAN: r0=311(x), r1=97(y), r2=105(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 97
LDI r2, 105
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

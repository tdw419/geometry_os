; DESCRIPTION: Places a black 29x110 rectangle at position (311, 81).
; PLAN: r0=311(x), r1=81(y), r2=29(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 81
LDI r2, 29
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

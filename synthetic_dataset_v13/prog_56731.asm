; DESCRIPTION: Places a black 110x94 rectangle at position (158, 44).
; PLAN: r0=158(x), r1=44(y), r2=110(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 44
LDI r2, 110
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black 66x106 rectangle at position (87, 8).
; PLAN: r0=87(x), r1=8(y), r2=66(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 8
LDI r2, 66
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

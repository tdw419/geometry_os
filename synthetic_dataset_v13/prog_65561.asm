; DESCRIPTION: Places a black 118x54 rectangle at position (177, 45).
; PLAN: r0=177(x), r1=45(y), r2=118(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 45
LDI r2, 118
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

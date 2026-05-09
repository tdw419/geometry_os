; DESCRIPTION: Places a purple 109x15 rectangle at position (311, 66).
; PLAN: r0=311(x), r1=66(y), r2=109(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 66
LDI r2, 109
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

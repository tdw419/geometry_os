; DESCRIPTION: Places a magenta 66x71 rectangle at position (311, 35).
; PLAN: r0=311(x), r1=35(y), r2=66(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 35
LDI r2, 66
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 66x118 rectangle at position (47, 3).
; PLAN: r0=47(x), r1=3(y), r2=66(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 3
LDI r2, 66
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

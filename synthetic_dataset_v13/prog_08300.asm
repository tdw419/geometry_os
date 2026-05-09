; DESCRIPTION: Places a magenta 118x44 rectangle at position (8, 118).
; PLAN: r0=8(x), r1=118(y), r2=118(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 118
LDI r2, 118
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 14x106 rectangle at position (417, 85).
; PLAN: r0=417(x), r1=85(y), r2=14(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 85
LDI r2, 14
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

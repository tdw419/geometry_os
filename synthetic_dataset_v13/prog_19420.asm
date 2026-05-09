; DESCRIPTION: Places a magenta 12x26 rectangle at position (311, 14).
; PLAN: r0=311(x), r1=14(y), r2=12(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 14
LDI r2, 12
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

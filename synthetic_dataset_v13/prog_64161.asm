; DESCRIPTION: Places a magenta 55x66 rectangle at position (311, 57).
; PLAN: r0=311(x), r1=57(y), r2=55(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 57
LDI r2, 55
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

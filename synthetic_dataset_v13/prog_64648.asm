; DESCRIPTION: Places a magenta 115x75 rectangle at position (207, 93).
; PLAN: r0=207(x), r1=93(y), r2=115(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 93
LDI r2, 115
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

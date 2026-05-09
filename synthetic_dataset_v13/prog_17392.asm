; DESCRIPTION: Places a magenta 18x25 rectangle at position (483, 183).
; PLAN: r0=483(x), r1=183(y), r2=18(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 183
LDI r2, 18
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 53x31 rectangle at position (456, 118).
; PLAN: r0=456(x), r1=118(y), r2=53(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 118
LDI r2, 53
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

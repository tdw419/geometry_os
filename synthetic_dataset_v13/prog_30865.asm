; DESCRIPTION: Places a magenta 60x53 rectangle at position (345, 119).
; PLAN: r0=345(x), r1=119(y), r2=60(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 119
LDI r2, 60
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

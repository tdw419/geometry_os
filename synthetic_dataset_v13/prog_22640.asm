; DESCRIPTION: Places a magenta 53x118 rectangle at position (131, 0).
; PLAN: r0=131(x), r1=0(y), r2=53(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 0
LDI r2, 53
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

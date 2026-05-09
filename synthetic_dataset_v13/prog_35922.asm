; DESCRIPTION: Places a magenta 53x20 rectangle at position (323, 61).
; PLAN: r0=323(x), r1=61(y), r2=53(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 61
LDI r2, 53
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

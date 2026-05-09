; DESCRIPTION: Places a magenta 54x72 rectangle at position (345, 131).
; PLAN: r0=345(x), r1=131(y), r2=54(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 131
LDI r2, 54
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

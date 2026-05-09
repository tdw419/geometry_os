; DESCRIPTION: Places a magenta 54x101 rectangle at position (131, 5).
; PLAN: r0=131(x), r1=5(y), r2=54(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 5
LDI r2, 54
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

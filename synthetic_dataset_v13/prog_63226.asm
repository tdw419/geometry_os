; DESCRIPTION: Places a magenta 52x101 rectangle at position (304, 15).
; PLAN: r0=304(x), r1=15(y), r2=52(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 15
LDI r2, 52
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 81x101 rectangle at position (429, 9).
; PLAN: r0=429(x), r1=9(y), r2=81(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 9
LDI r2, 81
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

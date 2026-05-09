; DESCRIPTION: Places a magenta 109x114 rectangle at position (257, 102).
; PLAN: r0=257(x), r1=102(y), r2=109(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 102
LDI r2, 109
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

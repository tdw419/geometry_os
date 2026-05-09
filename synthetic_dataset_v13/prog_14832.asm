; DESCRIPTION: Places a magenta 64x89 rectangle at position (388, 94).
; PLAN: r0=388(x), r1=94(y), r2=64(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 94
LDI r2, 64
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

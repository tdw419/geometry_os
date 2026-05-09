; DESCRIPTION: Places a magenta 77x57 rectangle at position (61, 90).
; PLAN: r0=61(x), r1=90(y), r2=77(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 90
LDI r2, 77
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 61x57 rectangle at position (419, 15).
; PLAN: r0=419(x), r1=15(y), r2=61(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 15
LDI r2, 61
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

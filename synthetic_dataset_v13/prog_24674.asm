; DESCRIPTION: Places a magenta 57x24 rectangle at position (151, 31).
; PLAN: r0=151(x), r1=31(y), r2=57(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 31
LDI r2, 57
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

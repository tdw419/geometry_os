; DESCRIPTION: Places a magenta 57x99 rectangle at position (73, 31).
; PLAN: r0=73(x), r1=31(y), r2=57(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 31
LDI r2, 57
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

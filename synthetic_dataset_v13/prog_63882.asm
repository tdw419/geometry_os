; DESCRIPTION: Places a magenta 30x57 rectangle at position (115, 13).
; PLAN: r0=115(x), r1=13(y), r2=30(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 13
LDI r2, 30
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

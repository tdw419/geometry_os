; DESCRIPTION: Places a magenta 57x15 rectangle at position (379, 57).
; PLAN: r0=379(x), r1=57(y), r2=57(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 57
LDI r2, 57
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

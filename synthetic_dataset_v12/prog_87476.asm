; DESCRIPTION: Places a magenta 23x13 rectangle at position (379, 233).
; PLAN: r0=379(x), r1=233(y), r2=23(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 233
LDI r2, 23
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

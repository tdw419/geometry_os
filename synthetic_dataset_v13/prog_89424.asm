; DESCRIPTION: Places a magenta 73x115 rectangle at position (379, 52).
; PLAN: r0=379(x), r1=52(y), r2=73(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 52
LDI r2, 73
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 17x112 rectangle at position (379, 42).
; PLAN: r0=379(x), r1=42(y), r2=17(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 42
LDI r2, 17
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 30x109 rectangle at position (379, 68).
; PLAN: r0=379(x), r1=68(y), r2=30(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 68
LDI r2, 30
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

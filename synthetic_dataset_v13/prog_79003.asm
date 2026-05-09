; DESCRIPTION: Places a magenta 87x87 rectangle at position (259, 36).
; PLAN: r0=259(x), r1=36(y), r2=87(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 36
LDI r2, 87
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

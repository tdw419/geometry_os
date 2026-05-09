; DESCRIPTION: Places a magenta 87x60 rectangle at position (57, 8).
; PLAN: r0=57(x), r1=8(y), r2=87(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 8
LDI r2, 87
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 100x87 rectangle at position (47, 11).
; PLAN: r0=47(x), r1=11(y), r2=100(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 11
LDI r2, 100
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

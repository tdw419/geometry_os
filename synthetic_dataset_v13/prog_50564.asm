; DESCRIPTION: Places a magenta 100x13 rectangle at position (9, 20).
; PLAN: r0=9(x), r1=20(y), r2=100(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 20
LDI r2, 100
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

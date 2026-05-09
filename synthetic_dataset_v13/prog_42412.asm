; DESCRIPTION: Places a magenta 64x69 rectangle at position (83, 185).
; PLAN: r0=83(x), r1=185(y), r2=64(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 185
LDI r2, 64
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

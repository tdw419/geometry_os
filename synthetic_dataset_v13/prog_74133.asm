; DESCRIPTION: Places a magenta 69x37 rectangle at position (402, 77).
; PLAN: r0=402(x), r1=77(y), r2=69(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 77
LDI r2, 69
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 87x43 rectangle at position (20, 1).
; PLAN: r0=20(x), r1=1(y), r2=87(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 1
LDI r2, 87
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 52x70 rectangle at position (69, 4).
; PLAN: r0=69(x), r1=4(y), r2=52(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 4
LDI r2, 52
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

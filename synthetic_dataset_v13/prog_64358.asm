; DESCRIPTION: Places a magenta 80x61 rectangle at position (69, 137).
; PLAN: r0=69(x), r1=137(y), r2=80(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 137
LDI r2, 80
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

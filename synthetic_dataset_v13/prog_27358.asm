; DESCRIPTION: Places a magenta 11x120 rectangle at position (137, 136).
; PLAN: r0=137(x), r1=136(y), r2=11(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 136
LDI r2, 11
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

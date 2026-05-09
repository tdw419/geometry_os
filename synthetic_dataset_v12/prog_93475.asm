; DESCRIPTION: Places a magenta 92x11 rectangle at position (137, 140).
; PLAN: r0=137(x), r1=140(y), r2=92(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 140
LDI r2, 92
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 53x92 rectangle at position (53, 75).
; PLAN: r0=53(x), r1=75(y), r2=53(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 75
LDI r2, 53
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

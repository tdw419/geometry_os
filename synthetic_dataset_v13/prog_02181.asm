; DESCRIPTION: Places a magenta 36x114 rectangle at position (92, 30).
; PLAN: r0=92(x), r1=30(y), r2=36(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 30
LDI r2, 36
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

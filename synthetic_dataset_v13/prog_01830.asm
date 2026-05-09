; DESCRIPTION: Places a magenta 92x78 rectangle at position (336, 47).
; PLAN: r0=336(x), r1=47(y), r2=92(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 47
LDI r2, 92
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

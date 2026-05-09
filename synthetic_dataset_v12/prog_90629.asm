; DESCRIPTION: Places a magenta 92x103 rectangle at position (258, 96).
; PLAN: r0=258(x), r1=96(y), r2=92(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 96
LDI r2, 92
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

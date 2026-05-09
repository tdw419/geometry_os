; DESCRIPTION: Places a magenta 94x92 rectangle at position (42, 105).
; PLAN: r0=42(x), r1=105(y), r2=94(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 105
LDI r2, 94
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

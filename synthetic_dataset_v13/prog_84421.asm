; DESCRIPTION: Places a magenta 14x26 rectangle at position (61, 49).
; PLAN: r0=61(x), r1=49(y), r2=14(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 49
LDI r2, 14
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

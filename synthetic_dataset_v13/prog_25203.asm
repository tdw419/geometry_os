; DESCRIPTION: Places a magenta 40x88 rectangle at position (345, 61).
; PLAN: r0=345(x), r1=61(y), r2=40(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 61
LDI r2, 40
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

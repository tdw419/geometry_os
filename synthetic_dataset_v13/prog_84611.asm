; DESCRIPTION: Places a magenta 115x63 rectangle at position (26, 101).
; PLAN: r0=26(x), r1=101(y), r2=115(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 101
LDI r2, 115
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 114x93 rectangle at position (54, 93).
; PLAN: r0=54(x), r1=93(y), r2=114(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 93
LDI r2, 114
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

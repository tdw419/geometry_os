; DESCRIPTION: Places a magenta 35x93 rectangle at position (22, 103).
; PLAN: r0=22(x), r1=103(y), r2=35(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 103
LDI r2, 35
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

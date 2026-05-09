; DESCRIPTION: Places a magenta 58x93 rectangle at position (40, 134).
; PLAN: r0=40(x), r1=134(y), r2=58(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 134
LDI r2, 58
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

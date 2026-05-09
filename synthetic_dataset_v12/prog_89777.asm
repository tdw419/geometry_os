; DESCRIPTION: Places a magenta 118x73 rectangle at position (220, 33).
; PLAN: r0=220(x), r1=33(y), r2=118(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 33
LDI r2, 118
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

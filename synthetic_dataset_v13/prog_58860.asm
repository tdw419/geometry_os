; DESCRIPTION: Places a magenta 60x120 rectangle at position (114, 110).
; PLAN: r0=114(x), r1=110(y), r2=60(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 110
LDI r2, 60
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

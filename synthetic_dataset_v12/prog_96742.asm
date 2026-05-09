; DESCRIPTION: Places a magenta 115x70 rectangle at position (13, 80).
; PLAN: r0=13(x), r1=80(y), r2=115(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 80
LDI r2, 115
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

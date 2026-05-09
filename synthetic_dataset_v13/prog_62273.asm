; DESCRIPTION: Places a magenta 89x70 rectangle at position (310, 23).
; PLAN: r0=310(x), r1=23(y), r2=89(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 23
LDI r2, 89
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 18x70 rectangle at position (100, 94).
; PLAN: r0=100(x), r1=94(y), r2=18(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 94
LDI r2, 18
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 75x119 rectangle at position (432, 50).
; PLAN: r0=432(x), r1=50(y), r2=75(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 50
LDI r2, 75
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

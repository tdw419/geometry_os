; DESCRIPTION: Places a magenta 21x119 rectangle at position (20, 132).
; PLAN: r0=20(x), r1=132(y), r2=21(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 132
LDI r2, 21
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

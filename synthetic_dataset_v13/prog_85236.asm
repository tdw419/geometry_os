; DESCRIPTION: Places a magenta 64x119 rectangle at position (365, 78).
; PLAN: r0=365(x), r1=78(y), r2=64(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 78
LDI r2, 64
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

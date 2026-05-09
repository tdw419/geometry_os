; DESCRIPTION: Places a magenta 105x87 rectangle at position (126, 119).
; PLAN: r0=126(x), r1=119(y), r2=105(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 119
LDI r2, 105
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

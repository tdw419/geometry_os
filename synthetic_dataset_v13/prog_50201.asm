; DESCRIPTION: Places a magenta 79x66 rectangle at position (44, 97).
; PLAN: r0=44(x), r1=97(y), r2=79(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 97
LDI r2, 79
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

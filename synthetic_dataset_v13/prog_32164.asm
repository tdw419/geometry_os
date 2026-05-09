; DESCRIPTION: Places a blue 85x89 rectangle at position (106, 97).
; PLAN: r0=106(x), r1=97(y), r2=85(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 97
LDI r2, 85
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta 31x22 rectangle at position (63, 84).
; PLAN: r0=63(x), r1=84(y), r2=31(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 84
LDI r2, 31
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

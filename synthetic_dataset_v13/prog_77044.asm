; DESCRIPTION: Places a magenta 58x63 rectangle at position (357, 97).
; PLAN: r0=357(x), r1=97(y), r2=58(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 97
LDI r2, 58
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

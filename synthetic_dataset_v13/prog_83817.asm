; DESCRIPTION: Renders a magenta box of size 88x89 starting at (110, 63).
; PLAN: r0=110(x), r1=63(y), r2=88(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 63
LDI r2, 88
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

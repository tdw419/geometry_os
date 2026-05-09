; DESCRIPTION: Renders a magenta box of size 36x106 starting at (83, 79).
; PLAN: r0=83(x), r1=79(y), r2=36(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 79
LDI r2, 36
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 79x118 starting at (195, 85).
; PLAN: r0=195(x), r1=85(y), r2=79(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 85
LDI r2, 79
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 79x65 starting at (323, 106).
; PLAN: r0=323(x), r1=106(y), r2=79(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 106
LDI r2, 79
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

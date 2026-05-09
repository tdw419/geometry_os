; DESCRIPTION: Renders a magenta box of size 85x37 starting at (8, 66).
; PLAN: r0=8(x), r1=66(y), r2=85(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 66
LDI r2, 85
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

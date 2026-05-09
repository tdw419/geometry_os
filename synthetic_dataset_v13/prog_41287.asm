; DESCRIPTION: Renders a magenta box of size 60x85 starting at (205, 84).
; PLAN: r0=205(x), r1=84(y), r2=60(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 84
LDI r2, 60
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

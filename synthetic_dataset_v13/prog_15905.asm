; DESCRIPTION: Renders a magenta box of size 112x44 starting at (119, 85).
; PLAN: r0=119(x), r1=85(y), r2=112(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 85
LDI r2, 112
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

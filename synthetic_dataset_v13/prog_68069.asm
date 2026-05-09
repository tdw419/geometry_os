; DESCRIPTION: Renders a magenta box of size 58x70 starting at (201, 185).
; PLAN: r0=201(x), r1=185(y), r2=58(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 185
LDI r2, 58
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

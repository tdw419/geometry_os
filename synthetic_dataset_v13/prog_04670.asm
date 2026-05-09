; DESCRIPTION: Renders a magenta box of size 109x22 starting at (201, 159).
; PLAN: r0=201(x), r1=159(y), r2=109(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 159
LDI r2, 109
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 45x80 starting at (399, 118).
; PLAN: r0=399(x), r1=118(y), r2=45(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 118
LDI r2, 45
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

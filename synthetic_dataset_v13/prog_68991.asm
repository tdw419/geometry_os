; DESCRIPTION: Renders a magenta box of size 110x89 starting at (32, 112).
; PLAN: r0=32(x), r1=112(y), r2=110(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 112
LDI r2, 110
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 68x89 starting at (341, 58).
; PLAN: r0=341(x), r1=58(y), r2=68(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 58
LDI r2, 68
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

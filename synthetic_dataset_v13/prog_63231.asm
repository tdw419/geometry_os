; DESCRIPTION: Renders a magenta box of size 19x89 starting at (55, 36).
; PLAN: r0=55(x), r1=36(y), r2=19(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 36
LDI r2, 19
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

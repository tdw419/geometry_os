; DESCRIPTION: Renders a magenta box of size 31x89 starting at (202, 85).
; PLAN: r0=202(x), r1=85(y), r2=31(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 85
LDI r2, 31
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

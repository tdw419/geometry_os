; DESCRIPTION: Renders a magenta box of size 78x106 starting at (89, 95).
; PLAN: r0=89(x), r1=95(y), r2=78(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 95
LDI r2, 78
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

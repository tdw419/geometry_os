; DESCRIPTION: Renders a magenta box of size 118x106 starting at (207, 73).
; PLAN: r0=207(x), r1=73(y), r2=118(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 73
LDI r2, 118
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

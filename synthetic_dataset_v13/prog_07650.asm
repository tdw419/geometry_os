; DESCRIPTION: Renders a magenta box of size 118x65 starting at (311, 116).
; PLAN: r0=311(x), r1=116(y), r2=118(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 116
LDI r2, 118
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

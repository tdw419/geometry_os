; DESCRIPTION: Renders a magenta box of size 118x108 starting at (106, 21).
; PLAN: r0=106(x), r1=21(y), r2=118(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 21
LDI r2, 118
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

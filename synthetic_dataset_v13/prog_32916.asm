; DESCRIPTION: Renders a magenta box of size 44x118 starting at (22, 112).
; PLAN: r0=22(x), r1=112(y), r2=44(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 112
LDI r2, 44
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 106x78 starting at (339, 112).
; PLAN: r0=339(x), r1=112(y), r2=106(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 112
LDI r2, 106
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

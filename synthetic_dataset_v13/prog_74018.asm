; DESCRIPTION: Renders a magenta box of size 98x118 starting at (264, 6).
; PLAN: r0=264(x), r1=6(y), r2=98(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 6
LDI r2, 98
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

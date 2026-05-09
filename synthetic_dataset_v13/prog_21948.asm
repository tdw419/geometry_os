; DESCRIPTION: Renders a magenta box of size 93x114 starting at (136, 2).
; PLAN: r0=136(x), r1=2(y), r2=93(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 2
LDI r2, 93
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

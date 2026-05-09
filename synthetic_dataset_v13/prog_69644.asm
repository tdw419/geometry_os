; DESCRIPTION: Renders a magenta box of size 52x118 starting at (310, 51).
; PLAN: r0=310(x), r1=51(y), r2=52(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 51
LDI r2, 52
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 118x119 starting at (291, 11).
; PLAN: r0=291(x), r1=11(y), r2=118(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 11
LDI r2, 118
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

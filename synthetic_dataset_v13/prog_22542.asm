; DESCRIPTION: Renders a magenta box of size 100x119 starting at (209, 31).
; PLAN: r0=209(x), r1=31(y), r2=100(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 31
LDI r2, 100
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

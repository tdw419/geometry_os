; DESCRIPTION: Renders a magenta box of size 119x74 starting at (194, 101).
; PLAN: r0=194(x), r1=101(y), r2=119(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 101
LDI r2, 119
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

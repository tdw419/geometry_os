; DESCRIPTION: Renders a magenta box of size 92x118 starting at (227, 48).
; PLAN: r0=227(x), r1=48(y), r2=92(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 48
LDI r2, 92
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

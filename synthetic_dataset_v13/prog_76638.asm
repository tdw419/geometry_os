; DESCRIPTION: Renders a magenta box of size 29x94 starting at (148, 116).
; PLAN: r0=148(x), r1=116(y), r2=29(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 116
LDI r2, 29
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

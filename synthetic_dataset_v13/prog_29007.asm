; DESCRIPTION: Renders a magenta box of size 116x98 starting at (22, 92).
; PLAN: r0=22(x), r1=92(y), r2=116(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 92
LDI r2, 116
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

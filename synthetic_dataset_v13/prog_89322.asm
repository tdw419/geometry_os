; DESCRIPTION: Renders a magenta box of size 77x94 starting at (10, 153).
; PLAN: r0=10(x), r1=153(y), r2=77(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 153
LDI r2, 77
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

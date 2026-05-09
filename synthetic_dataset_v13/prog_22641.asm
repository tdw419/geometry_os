; DESCRIPTION: Renders a magenta box of size 73x101 starting at (120, 44).
; PLAN: r0=120(x), r1=44(y), r2=73(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 44
LDI r2, 73
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

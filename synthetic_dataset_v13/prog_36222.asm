; DESCRIPTION: Renders a magenta box of size 98x101 starting at (54, 115).
; PLAN: r0=54(x), r1=115(y), r2=98(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 115
LDI r2, 98
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

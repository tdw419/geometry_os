; DESCRIPTION: Renders a magenta box of size 56x101 starting at (150, 81).
; PLAN: r0=150(x), r1=81(y), r2=56(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 81
LDI r2, 56
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

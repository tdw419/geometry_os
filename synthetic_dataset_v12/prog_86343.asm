; DESCRIPTION: Renders a magenta box of size 58x26 starting at (10, 101).
; PLAN: r0=10(x), r1=101(y), r2=58(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 101
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

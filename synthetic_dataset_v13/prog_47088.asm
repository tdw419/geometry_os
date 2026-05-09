; DESCRIPTION: Renders a magenta box of size 85x114 starting at (102, 30).
; PLAN: r0=102(x), r1=30(y), r2=85(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 30
LDI r2, 85
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

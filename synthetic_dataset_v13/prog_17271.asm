; DESCRIPTION: Renders a magenta box of size 20x85 starting at (105, 114).
; PLAN: r0=105(x), r1=114(y), r2=20(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 114
LDI r2, 20
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

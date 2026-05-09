; DESCRIPTION: Renders a magenta box of size 20x95 starting at (109, 114).
; PLAN: r0=109(x), r1=114(y), r2=20(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 114
LDI r2, 20
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

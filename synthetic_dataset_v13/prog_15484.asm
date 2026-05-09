; DESCRIPTION: Renders a magenta box of size 88x107 starting at (74, 2).
; PLAN: r0=74(x), r1=2(y), r2=88(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 2
LDI r2, 88
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

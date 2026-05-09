; DESCRIPTION: Renders a magenta box of size 26x87 starting at (134, 51).
; PLAN: r0=134(x), r1=51(y), r2=26(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 51
LDI r2, 26
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

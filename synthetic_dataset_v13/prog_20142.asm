; DESCRIPTION: Renders a magenta box of size 100x79 starting at (76, 1).
; PLAN: r0=76(x), r1=1(y), r2=100(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 1
LDI r2, 100
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

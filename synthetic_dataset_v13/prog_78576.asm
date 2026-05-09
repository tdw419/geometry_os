; DESCRIPTION: Renders a magenta box of size 95x85 starting at (169, 56).
; PLAN: r0=169(x), r1=56(y), r2=95(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 56
LDI r2, 95
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

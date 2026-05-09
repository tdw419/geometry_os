; DESCRIPTION: Renders a magenta box of size 114x99 starting at (379, 69).
; PLAN: r0=379(x), r1=69(y), r2=114(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 69
LDI r2, 114
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

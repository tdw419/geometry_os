; DESCRIPTION: Renders a magenta box of size 71x22 starting at (10, 23).
; PLAN: r0=10(x), r1=23(y), r2=71(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 23
LDI r2, 71
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

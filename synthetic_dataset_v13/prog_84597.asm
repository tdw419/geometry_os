; DESCRIPTION: Renders a magenta box of size 10x22 starting at (335, 155).
; PLAN: r0=335(x), r1=155(y), r2=10(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 155
LDI r2, 10
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

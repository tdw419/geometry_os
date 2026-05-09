; DESCRIPTION: Renders a magenta box of size 55x101 starting at (335, 137).
; PLAN: r0=335(x), r1=137(y), r2=55(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 137
LDI r2, 55
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

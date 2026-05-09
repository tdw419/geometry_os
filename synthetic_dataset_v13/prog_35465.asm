; DESCRIPTION: Renders a magenta box of size 29x79 starting at (0, 78).
; PLAN: r0=0(x), r1=78(y), r2=29(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 78
LDI r2, 29
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 11x48 starting at (13, 78).
; PLAN: r0=13(x), r1=78(y), r2=11(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 78
LDI r2, 11
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

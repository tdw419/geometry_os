; DESCRIPTION: Renders a magenta box of size 87x119 starting at (286, 45).
; PLAN: r0=286(x), r1=45(y), r2=87(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 45
LDI r2, 87
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

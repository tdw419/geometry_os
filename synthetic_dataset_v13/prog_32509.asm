; DESCRIPTION: Renders a magenta box of size 110x78 starting at (289, 148).
; PLAN: r0=289(x), r1=148(y), r2=110(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 148
LDI r2, 110
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

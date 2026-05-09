; DESCRIPTION: Renders a magenta box of size 78x37 starting at (119, 80).
; PLAN: r0=119(x), r1=80(y), r2=78(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 80
LDI r2, 78
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

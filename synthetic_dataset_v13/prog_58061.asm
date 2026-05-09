; DESCRIPTION: Renders a magenta box of size 89x37 starting at (78, 77).
; PLAN: r0=78(x), r1=77(y), r2=89(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 77
LDI r2, 89
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

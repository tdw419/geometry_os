; DESCRIPTION: Renders a magenta box of size 12x98 starting at (47, 110).
; PLAN: r0=47(x), r1=110(y), r2=12(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 110
LDI r2, 12
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

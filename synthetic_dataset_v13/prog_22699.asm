; DESCRIPTION: Renders a magenta box of size 83x108 starting at (106, 106).
; PLAN: r0=106(x), r1=106(y), r2=83(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 106
LDI r2, 83
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

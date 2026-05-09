; DESCRIPTION: Renders a magenta box of size 117x35 starting at (357, 3).
; PLAN: r0=357(x), r1=3(y), r2=117(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 3
LDI r2, 117
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 45x39 starting at (132, 78).
; PLAN: r0=132(x), r1=78(y), r2=45(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 78
LDI r2, 45
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
